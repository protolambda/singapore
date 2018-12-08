
import 'package:protolith/blockchain/block/standard_block.dart';
import 'package:protolith/blockchain/chain/block_chain.dart';
import 'package:protolith/blockchain/chain/standard_block_chain.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/unfinalized/dag/dag.dart';
import 'package:singapore/beacon/unfinalized/ghost.dart';

class BeaconEntry extends DagNode<Hash256> {

  BeaconBlock block;

  BeaconBlockMeta state;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BeaconEntry &&
              runtimeType == other.runtimeType &&
              block.hash == other.block.hash;

  @override
  int get hashCode => block.hashCode;

  @override
  Hash256 get inwards => null;

  @override
  Hash256 get key => block.hash;

}

class BeaconBlockChain<M extends BeaconBlockMeta, B extends BeaconBlock<M>> extends BlockChain<M, B> {

  /// The standard chain is synced as well, to use for POW.
  /// (Note; this is just the interface, data may come from elsewhere)
  StandardBlockChain eth1Chain;

  // TODO: the current `lastBlock` is just the first of the list of blocks
  //  with `block.number == blockheight`.
  // For real sharding, GHOST has to be implemented as fork-choice.

  /// The unfinalized beacon block-state tuples stored in a leveled DAG.
  /// A path may be derived starting from the last finalized beacon state,
  ///  and derive a head.
  final Dag<BeaconEntry> beaconStates = new Dag<BeaconEntry>(const GHOST());

  @override
  Future<M> getBlockMeta(int blockNum) async {
    // if the block is not finalized (i.e. under block-height), then look in the DAG.
    if (blockHeight <= blockNum) {
      if (blockNum < beaconStates.maxLevel) {
        return beaconStates.findPath(maxLevel: blockNum).last.state;
      }
    } else {
      // old block, just retrieve meta from DB
      return await this.getFinalizedBeaconState(blockNum);
    }
      throw Exception("Block $blockNum is too new, no data available, state data is at ${blockHeight - 1}");
  }

  /// temporary hack; we can implement a real DB when we need it
  Map<int, BeaconBlockMeta> finalizedBeaconStateDB = new Map();

  /// Older states are just saved in a "DB", we do not need a DAG / GHOST,
  ///  finalized finalized block states will not change.
  Future<BeaconBlockMeta> getFinalizedBeaconState(int slotNum) async {
    return this.finalizedBeaconStateDB[slotNum];
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
