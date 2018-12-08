
import 'package:protolith/blockchain/block/standard_block.dart';
import 'package:protolith/blockchain/chain/block_chain.dart';
import 'package:protolith/blockchain/chain/standard_block_chain.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/unfinalized/beacon_entry.dart';
import 'package:singapore/beacon/unfinalized/beacon_fork_choice.dart';
import 'package:singapore/beacon/unfinalized/dag/dag.dart';


class BeaconBlockChain<M extends BeaconBlockMeta, B extends BeaconBlock<M>> extends BlockChain<M, B> {

  /// The standard chain is synced as well, to use for POW.
  /// (Note; this is just the interface, data may come from elsewhere)
  StandardBlockChain eth1Chain;

  /// The unfinalized beacon blocks are stored in a leveled DAG.
  /// A path may be derived starting from the last finalized beacon state,
  ///  and derive a head.
  final Dag<BeaconEntry> beaconBlocks = new Dag<BeaconEntry>(lmdGhost);

  BeaconBlockMeta state;

  /// Blockheight is interchangeable with slot, but kept for compatibility.
  int get blockHeight => state.slot;
  set blockHeight(int v) => state.slot = v;

  Future<B> get lastBlock async {
    return await db.getBlockByHash(state.latestBlockHashes[state.slot]);
  }

  @override
  Future<M> getBlockMeta(int blockNum) async {
    // Always return state; this is finalized. // TODO: worth/necessary to still keep old states?
    // Conform to the block-number based meta retrieval; this makes coding a fork cleaner.
    return state;
  }

  B lastProposedBlock;

  /// Transition to the next slot. (and processing any proposed block)
  Future nextSlot() async {
    // update state data
    state.slot += 1;
    B latestBlock = null;
    if (lastProposedBlock != null) {
      // Verify that block.slot == state.slot
      if (lastProposedBlock.slot != state.slot)
        throw Exception("Proposed block is for mismatching slot number");
      // Verify that block.ancestor_hashes equals get_updated_ancestor_hashes(latest_block, latest_hash)
      List<Hash256> hashes = latestBlock.getUpdatedAncestorHashes();
      if (!listElementwiseComparison(lastProposedBlock.ancestorHashes, hashes))
        throw Exception("New block ancestors are invalid.");

      latestBlock = lastProposedBlock;
      lastProposedBlock = null;
    } else {
      latestBlock = (await lastBlock);
    }
    state.latestBlockHashes.add(latestBlock.hash);
  }



  /// TODO: based on chain consensus we need to move beacon states from unfinalized DAG to finalized DB.

  /// Future throws if block is invalid.
  Future validateNewBlock(B block) async {
    // From spec:
    // For a beacon chain block, block, to be processed by a node, the following conditions must be met:
    B prev = await lastBlock;
    // 1. The parent block with hash block.ancestor_hashes[0] has been processed and accepted.
    if (block.ancestorHashes[0] != prev.hash) throw Exception("Blockchain not synced, unknown ancestor reference.");
    // 2. The node has processed its state up to slot, block.slot - 1. [in a situation the slot is not active yet]
    if (block.slot == blockHeight + 1) throw Exception("Blockchain not synced, cannot add block #${block.slot} to chain at height #${blockHeight}.");
    // 3. The Ethereum 1.0 block pointed to by the state.processed_pow_receipt_root has been processed and accepted.
    M currentMeta = await getBlockMeta(block.slot);
    StandardBlock currentEth1Ref = await eth1Chain.getBlock(currentMeta.processedPowReceiptRoot);
    if (currentEth1Ref == null) throw Exception("Node is not synced with eth1.0 chain up to last block refered to by beacon state.");
    // 4. The node's local clock time is greater than or equal to state.genesis_time + block.slot * SLOT_DURATION.
    // TODO: for demo purposes we completely ignore time; it's just an additional
    //   acceptation thing to prevent timestamp manipulation, which is just what we do in a demo.
  }

  @override
  Future addValidBlock(B block) async {
    // Instead of adding it to the DB, we keep track of the last proposed block,
    //  and then the slot transition will process it.
    if (lastProposedBlock == null || lastProposedBlock.slot <= block.slot) {
      lastProposedBlock = block;
    }
  }

}
