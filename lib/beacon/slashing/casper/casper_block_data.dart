
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/slashing/casper/casper_slashing.dart';

mixin CasperBlockData<M extends BeaconBlockMeta> on Block<M> {

  List<CasperSlashing> casperSlashings;

}
