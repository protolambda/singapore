
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/slashing/proposer/proposer_slashing.dart';

mixin ProposerBlockData<M extends BeaconBlockMeta> on Block<M> {

  List<ProposerSlashing> proposerSlashings;

}
