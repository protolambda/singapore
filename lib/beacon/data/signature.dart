import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/crypto/BLSSignature.dart';

mixin Signature<M extends BeaconBlockMeta> on Block<M> {
  List<BLSSignature> signature;

  void verifySignature(M meta) {
    // TODO: verify signature
  }

}
