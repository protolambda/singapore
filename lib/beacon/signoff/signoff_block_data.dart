import 'package:protolith/blockchain/block/block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/crypto/BLSSignature.dart';

mixin SignoffBlockData<M extends BeaconBlockMeta> on Block<M> {

  /// the state being signed
  Hash256 stateRoot;

  /// the signature
  BLSSignature signature;

  void verifySignature(M meta) {
    // TODO: verify signature
  }

}
