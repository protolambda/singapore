
import 'package:protolith/blockchain/sync/syncer.dart';
import 'package:protolith/network/network.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/beacon_block_chain.dart';

class BeaconNetwork<M extends BeaconBlockMeta, B extends BeaconBlock<M>, C extends BeaconBlockChain<M, B>> extends Network<M, B, C> {

  BeaconNetwork(int networkID, C chain) : super(networkID, chain);

  @override
  Syncer<M, B, C> createSyncer() {
    // TODO: init syncer properly
    return new Syncer();
  }

}
