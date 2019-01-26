
import 'dart:typed_data';

import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/crypto/BLSSignature.dart';

mixin RandaoBlockData<M extends BeaconBlockMeta> on Block<M> {

  BLSSignature randaoReveal;

}
