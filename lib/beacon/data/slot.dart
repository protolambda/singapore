
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';

mixin Slot<M extends BeaconBlockMeta> on Block<M> {

  int slot;

}
