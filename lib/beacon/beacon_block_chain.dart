
import 'package:protolith/blockchain/block/standard_block.dart';
import 'package:protolith/blockchain/chain/block_chain.dart';
import 'package:protolith/blockchain/chain/standard_block_chain.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:protolith/blockchain/exceptions/unknown_block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/unfinalized/beacon_entry.dart';
import 'package:singapore/beacon/unfinalized/beacon_fork_choice.dart';
import 'package:singapore/beacon/unfinalized/dag/dag.dart';


class BeaconBlockChain<M extends BeaconBlockMeta, B extends BeaconBlock<M>> extends BlockChain<M, B> {


  // constant, but in meta to easily customize it per type of chain.
  // 64 slots
  final int EPOCH_LENGTH = 1 << 6;
  // 6 seconds
  final int SLOT_DURATION = 6;

  /// the Unix time of the genesis beacon chain block at slot 0
  int genesisTime;


  /// The standard chain is synced as well, to use for POW.
  /// (Note; this is just the interface, data may come from elsewhere)
  StandardBlockChain eth1Chain;

  /// The unfinalized beacon blocks are stored in a leveled DAG.
  /// A path may be derived starting from the last finalized beacon state,
  ///  and derive a head.
  Dag<BeaconEntry> _beaconBlocks;
  Dag<BeaconEntry> get beaconBlocks => _beaconBlocks;

  BeaconBlockChain() {
    // TODO initialize state.
    // TODO select canonical chain head based on DAG
    // TODO process slots/epochs after changing block head.

    // TODO; state should be retrieved during scoring, based on block being scored, i.e. not static.
    this._beaconBlocks = new Dag<BeaconEntry>(getLmdGhost(this.state));
  }

  /// Returns the post-state for the block [blockHash].
  Future<M> getBlockMeta(Hash256 hash, {MetaDataDB db}) async {
    // Check if the block is known. If not, we cannot construct a post-state for the block.
    B b = await this.getBlock(hash);
    if (b == null) throw UnknownBlockException(hash, "Block hash is unknown. Cannot build state for it.");

    // Create the view for the block.
    BeaconBlockMeta meta = new BeaconBlockMeta(b.hash, b.number, db ?? metaDB);

    return meta;
  }


  @override
  Future validateBlock(B block) async {
    // From spec:
    // For a beacon chain block, block, to be processed by a node, the following conditions must be met:

    BeaconBlockMeta meta = await getBlockMeta(headBlockHash);

    // 1. The parent block with hash block.ancestor_hashes[0] has been processed and accepted.
    if (block.ancestorHashes[0] != meta.hash) throw Exception("Blockchain not synced, unknown ancestor reference.");
    // 2. The node has processed its state up to slot, block.slot - 1. [in a situation the slot is not active yet]
    if (block.slot == meta.slot + 1) throw Exception("Blockchain not synced, cannot add block #${this.slot} to beacon chain at slot #${meta.slot}.");
    // 3. The Ethereum 1.0 block pointed to by the state.processed_pow_receipt_root has been processed and accepted.
    StandardBlock currentEth1Ref = await eth1Chain.getBlock(meta.processedPowReceiptRoot);
    if (currentEth1Ref == null) throw Exception("Node is not synced with eth1.0 chain up to last block refered to by beacon state.");
    // 4. The node's local clock time is greater than or equal to state.genesis_time + block.slot * SLOT_DURATION.
    if ((new DateTime.now().millisecondsSinceEpoch ~/ 1000) >= (genesisTime + (block.slot * SLOT_DURATION))) throw Exception("Node time is not as far as block. Cannot accept block.");

    // validate the block like normal, using the rules as specified in the block class.
    super.validateBlock(block);
  }

  /// Transition to the next slot. (and processing any proposed block)
  Future nextSlot() async {
    // update state data

    BeaconBlockMeta meta = await getBlockMeta(headBlockHash);

    meta.slot += 1;

    // TODO update other counters (see spec)

    meta.latestBlockRoots.add(meta.hash);

    // TODO more block root processing

    // If it is an epoch start, then process some more
    if (meta.slot % EPOCH_LENGTH == 0) {
      nextEpoch();
    }
  }

  Future nextEpoch() async {
    BeaconBlockMeta meta = await getBlockMeta(headBlockHash);
    if (meta.slot % EPOCH_LENGTH != 0) return;

    // TODO implement epoch processing
  }

  Future onNewProposedBlock(B block) async {
    // Get the parent state where we will build on.
    BeaconBlockMeta meta = await getBlockMeta(block.parentHash);
    // TODO delta meta for proposed block.

  }


}
