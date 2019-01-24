
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/exits/exit.dart';

mixin Exits<M extends BeaconBlockMeta> on Block<M> {

  List<Exit> exits;

}
