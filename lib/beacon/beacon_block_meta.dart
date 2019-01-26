import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/pow/ethash/constants.dart';

import 'package:singapore/beacon/attestation/attestations_meta.dart';
import 'package:singapore/beacon/crosslinks/cross_links_meta.dart';
import 'package:singapore/beacon/eth1/eth1_meta.dart';
import 'package:singapore/beacon/finality/finality_meta.dart';
import 'package:singapore/beacon/fork/fork_meta.dart';
import 'package:singapore/beacon/randao/randao_meta.dart';
import 'package:singapore/beacon/recent_state/recent_state_meta.dart';
import 'package:singapore/beacon/validators/validators_meta.dart';

class BeaconBlockMeta extends BlockMeta
    with
        AttestationsMeta,
        CrossLinksMeta,
        Eth1Meta,
        FinalityMeta,
        ForkMeta,
        RandaoMeta,
        RecentStateMeta,
        ValidatorsMeta {

  /// the current slot number
  int slot;

  BeaconBlockMeta(Hash256 hash, this.slot, int blockNum, MetaDataDB db)
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
