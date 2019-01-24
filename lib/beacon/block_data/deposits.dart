
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/deposits/deposit.dart';

mixin Deposits<M extends BeaconBlockMeta> on Block<M> {

  List<Deposit> deposits;

}
