import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/pow/ethash/constants.dart';
import 'package:singapore/beacon/meta/finality.dart';
import 'package:singapore/beacon/meta/fork.dart';
import 'package:singapore/beacon/meta/eth1.dart';
import 'package:singapore/beacon/meta/randao.dart';
import 'package:singapore/beacon/meta/recent_state.dart';
import 'package:singapore/beacon/meta/validator_registry.dart';

class BeaconBlockMeta extends BlockMeta
  with FinalityMeta, ForkMeta, Eth1Meta, RandaoMeta, RecentStateMeta, ValidatorRegistryMeta {

  /// TODO move to storage
  /// the current slot number
  int slot;

  BeaconBlockMeta(Hash256 hash, int blockNum, MetaDataDB db)
      : super(hash, blockNum, db);


  /// Transition to the next slot. (without processing any block)
  Future nextSlot() async {
    // update state data
    slot += 1;

    // TODO update other counters (see spec)

    //latestBlockRoots.add(blockHash);

    // TODO more block root processing

    // If it is an epoch start, then process some more
    if (slot % EPOCH_LENGTH == 0) {
      nextEpoch();
    }
  }

  Future nextEpoch() async {
    if (this.slot % EPOCH_LENGTH != 0) return;

    // TODO implement epoch processing
    // TODO there's finalization and crosslinks to be made every epoch
  }

}
