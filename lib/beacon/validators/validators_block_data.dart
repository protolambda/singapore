
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/validators/exit.dart';

mixin ValidatorsBlockData<M extends BeaconBlockMeta> on Block<M> {

  List<Exit> exits;

}
