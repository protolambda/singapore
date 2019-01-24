
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/slashings/casper/casper_slashing.dart';
import 'package:singapore/beacon/slashings/proposer/proposer_slashing.dart';

mixin Slashings<M extends BeaconBlockMeta> on Block<M> {

  List<ProposerSlashing> proposerSlashings;
  List<CasperSlashing> casperSlashings;

}
