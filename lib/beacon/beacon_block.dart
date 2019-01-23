import 'dart:async';
import 'dart:typed_data';

import 'package:protolith/blockchain/block/block.dart';
import 'package:protolith/blockchain/exceptions/invalid_block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:protolith/crypto/sha3.dart';
import 'package:protolith/encodings/rlp/rlp_encode.dart';
import 'package:protolith/encodings/serializeables/rlp_serializable.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/data/signature.dart';
import 'package:singapore/beacon/data/attestation.dart';
import 'package:singapore/beacon/data/randao.dart';
import 'package:singapore/beacon/data/slot.dart';

class BeaconBlock<M extends BeaconBlockMeta> extends Block<M>
    with
        Signature<M>,
        Attestation<M>,
        Randao<M>,
        Slot<M>,
        RlpEncodeable,
        RlpDecodeable {

  List<Hash256> ancestorHashes;
  Hash256 stateRoot;
  Hash256 candidatePowReceiptRoot;


  @override
  List<dynamic> getRlpElements() => [
    // TODO
  ];

  @override
  List<RlpDecSetter> getRlpSetters() => [
    // TODO
  ];

  @override
  Hash256 computeHash(M meta) {
    this.hash = sha3_256(byteView(encodeRLP(meta)));
    return this.hash;
  }

  @override
  Future validateWithState(M meta) async {
    // TODO change to InvalidState exception
    if (number != meta.slot + 1)
      throw InvalidBlockException<M, Block<M>>(this,
          "Known pre state is at ${meta.slot}, block with slot number ${slot} cannot be connected.");

    // TODO validate block


    return false;
  }

  /// Applies the implications of this block to [delta],
  ///  a meta data DB view of the post-state of the parent block of this block,
  ///  storing every change, to be finalized once the block processing is done
  ///  (i.e. hash is known).
  Future applyToDelta(M delta) async {
    super.applyToDelta(delta);

    // check signature
    this.verifySignature(delta);

    // handle attestations
    this.verifyAttestations(delta);
    this.processAttestations(delta);

    // randao
    this.verifyRandao(delta);
    this.processRandao(delta);

  }

  Future applyEpochToDelta(M delta) async {
    // TODO handle epoch changes

    // TODO there's finalization and crosslinks to be made every epoch
  }

  /// Get the header-bytes used to create the block,
  ///  without the mixHash and nonce.
  Uint8List getTruncatedHeaderBytes() =>
      encodeRLP([
        // TODO
      ]);

  List<Hash256> getUpdatedAncestorHashes() {
    List<Hash256> newAncestorHashes = new List.from(this.ancestorHashes);
    for (int i = 0; i < 32; i++) {
      if (this.slot % (1 << i) == 0) {
        newAncestorHashes[i] = this.hash;
      }
    }
    return newAncestorHashes;
  }

}
