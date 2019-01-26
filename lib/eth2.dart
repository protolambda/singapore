
import 'package:protolith/blockchain/block/standard_block.dart';
import 'package:protolith/blockchain/chain/standard_block_chain.dart';
import 'package:protolith/blockchain/meta/blocks/standard_meta.dart';
import 'package:protolith/network/standard_network.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_chain.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/beacon_network.dart';

class Eth2 {

  BeaconNetwork<BeaconBlockMeta, BeaconBlock, BeaconBlockChain<BeaconBlockMeta, BeaconBlock<BeaconBlockMeta>>> beaconNetwork;

//  List<ShardNetwork<>> shards;

  /// To be phased out, current sharding spec has a need for it.
  StandardNetwork<StandardBlockMeta, StandardBlock, StandardBlockChain<StandardBlockMeta, StandardBlock<StandardBlockMeta>>> eth1Network;

  /// Create a new Eth 2.0 client.
  /// This connects to:
  ///  - Eth 1.0 network, as specified by [eth1NetworkId] and [eth1ChainId].
  ///  - Eth 2.0 beacon chain, as specified by [eth2NetworkId]. //TODO: different beacon chains can have different network IDs, similar to Eth 1.0?
  ///  - Eth 2.0 shards // TODO: connect to beacon chain
  Eth2(int eth1NetworkId, eth1ChainId, eth2NetworkId) {

    var eth1Chain = new StandardBlockChain<StandardBlockMeta, StandardBlock<StandardBlockMeta>>();
    eth1Network = new StandardNetwork(eth1NetworkId, eth1ChainId, eth1Chain);

    // TODO genesis time
    int genesisTime = 0;
    var beaconChain = new BeaconBlockChain<BeaconBlockMeta, BeaconBlock<BeaconBlockMeta>>(genesisTime);
    beaconNetwork = new BeaconNetwork(eth2NetworkId, beaconChain);

    // TODO: initialize shards.
  }
}