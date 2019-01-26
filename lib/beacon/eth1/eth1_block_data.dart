
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/eth1/eth1_data.dart';

mixin Eth1BlockData<M extends BeaconBlockMeta> on Block<M> {

  Eth1Data eth1data;

}
