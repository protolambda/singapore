
import 'package:protolith/blockchain/block/block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';

mixin State<M extends BeaconBlockMeta> on Block<M> {

  Hash256 stateRoot;

}
