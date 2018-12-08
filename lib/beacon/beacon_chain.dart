
import 'package:protolith/blockchain/block/standard_block.dart';
import 'package:protolith/blockchain/chain/blockchain.dart';
import 'package:protolith/blockchain/chain/standard_chain.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';

class BeaconChain<M extends BeaconBlockMeta, B extends BeaconBlock<M>> extends BlockChain<M, B> {

  /// The standard chain is synced as well, to use for POW.
  /// (Note; this is just the interface, data may come from elsewhere)
  StandardChain eth1Chain;

  // TODO: instead of keeping the state for every block in memory this
  //  could also be extracted as a special DB component,
  //  or just only support getting the state of the last block.
  List<BeaconBlockMeta> beaconStates = [
    // first item is the genesis state (block index 0)
    BeaconBlockMeta()
  ];

  @override
  Future<M> getBlockMeta(int blockNum) async {
    if (beaconStates.length <= blockNum)
      throw Exception("Block $blockNum is too new, no data available, state data is at ${beaconStates.length - 1}");
    return beaconStates[blockNum];
  }

  /// Future throws if block is invalid.
  Future validateNewBlock(B block) async {
    // From spec:
    // For a beacon chain block, block, to be processed by a node, the following conditions must be met:
    B prev = await lastBlock;
    // 1. The parent block with hash block.ancestor_hashes[0] has been processed and accepted.
    if (block.ancestorHashes[0] != prev.hash) throw Exception("Blockchain not synced, unknown ancestor reference.");
    // 2. The node has processed its state up to slot, block.slot - 1.
    if (block.slot == blockHeight + 1) throw Exception("Blockchain not synced, cannot add block #${block.slot} to chain at height #${blockHeight}.");
    // 3. The Ethereum 1.0 block pointed to by the state.processed_pow_receipt_root has been processed and accepted.
    M currentMeta = await getBlockMeta(block.slot);
    StandardBlock currentEth1Ref = await eth1Chain.getBlock(currentMeta.processedPowReceiptRoot);
    if (currentEth1Ref == null) throw Exception("Node is not synced with eth1.0 chain up to last block refered to by beacon state.");
    // 4. The node's local clock time is greater than or equal to state.genesis_time + block.slot * SLOT_DURATION.
    // TODO: for demo purposes we completely ignore time; it's just an additional
    //   acceptation thing to prevent timestamp manipulation, which is just what we do in a demo.
  }

}
