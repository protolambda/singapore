import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/committees/shard_committee.dart';
import 'package:singapore/beacon/committees/shard_reassignment_record.dart';

mixin RandaoMeta on BeaconBlockMeta {

  Hash256 randaoMix;
  Hash256 nextSeed;

  List<List<ShardCommittee>> shardCommitteesAtSlots;
  List<List<int>> persistentCommittees;
  List<ShardReassignmentRecord> persistentCommitteeReassignments;
}