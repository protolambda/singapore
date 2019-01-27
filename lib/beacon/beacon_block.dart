import 'dart:async';
import 'dart:typed_data';

import 'package:protolith/blockchain/block/block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:protolith/crypto/sha3.dart';
import 'package:protolith/encodings/rlp/rlp_encode.dart';
import 'package:protolith/encodings/serializeables/rlp_serializable.dart';

import 'package:singapore/beacon/beacon_block_meta.dart';

import 'package:singapore/beacon/attestation/attestations_block_data.dart';
import 'package:singapore/beacon/slashing/casper/casper_block_data.dart';
import 'package:singapore/beacon/custody/custody_block_data.dart';
import 'package:singapore/beacon/deposits/deposits_block_data.dart';
import 'package:singapore/beacon/eth1/eth1_block_data.dart';
import 'package:singapore/beacon/slashing/proposer/proposer_block_data.dart';
import 'package:singapore/beacon/randao/randao_block_data.dart';
import 'package:singapore/beacon/signoff/signoff_block_data.dart';
import 'package:singapore/beacon/validators/validators_block_data.dart';

class BeaconBlock<M extends BeaconBlockMeta> extends Block<M>
    with
        AttestationsBlockData<M>,
        CasperBlockData<M>,
        CustodyBlockData<M>,
        DepositsBlockData<M>,
        Eth1BlockData<M>,
        ProposerBlockData<M>,
        RandaoBlockData<M>,
        SignoffBlockData<M>,
        ValidatorsBlockData<M>,
        RlpEncodeable,
        RlpDecodeable {

  int slot;

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

    // randao TODO this changed in spec.
//    this.verifyRandao(delta);
//    this.processRandao(delta);

  }

  /// Get the header-bytes used to create the block,
  ///  without the mixHash and nonce.
  Uint8List getTruncatedHeaderBytes() =>
      encodeRLP([
        // TODO
      ]);

}
