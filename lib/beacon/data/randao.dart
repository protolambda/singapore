
import 'dart:typed_data';

import 'package:protolith/crypto/sha3.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:protolith/blockchain/block/block.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/committees/shard_committee.dart';
import 'package:singapore/beacon/validators/validator_record.dart';

mixin Randao<M extends BeaconBlockMeta> on Block<M> {

  Hash256 randaoReveal;

  void verifyRandao(M meta) {
    ValidatorRecord proposer = meta.validatorRegistry[getBeaconProposerIndex(meta, meta.slot)];
    var repeatHash = repeatFn((Uint8List x) => sha3_256(byteView(x)).uint8list);
    repeatHash(this.randaoReveal, proposer.randaoSkips + 1) == proposer.randaoCommitment;
  }

  void processRandao(M meta) {
    ValidatorRecord proposer = meta.validatorRegistry[getBeaconProposerIndex(meta, meta.slot)];
    proposer.randaoCommitment = this.randaoReveal;
    proposer.randaoSkips = 0;
  }


  /// Returns the beacon proposer index for the [slot].
  int getBeaconProposerIndex(M meta, int s) {
    List<int> firstCommittee = getShardCommitteesAtSlot(meta, s).first.committee;
    return firstCommittee[s % firstCommittee.length];
  }

  /// Returns the [ShardCommittee] for the slot [s].
  List<ShardCommittee> getShardCommitteesAtSlot(M meta, int s) {
    int earliestSlotInArray = meta.slot - (meta.slot % meta.EPOCH_LENGTH) - meta.EPOCH_LENGTH;
    // assert earliest_slot_in_array <= slot < earliest_slot_in_array + EPOCH_LENGTH * 2
    return meta.shardCommitteesAtSlots[s - earliestSlotInArray];
  }
}
