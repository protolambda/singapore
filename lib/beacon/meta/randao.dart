import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/committees/shard_committee.dart';
import 'package:singapore/beacon/committees/shard_reassignment_record.dart';

mixin Randao on BlockMeta {

  Hash256 randaoMix;
  Hash256 nextSeed;

  List<List<ShardCommittee>> shardCommitteesAtSlots;
  List<List<int>> persistentCommittees;
  List<ShardReassignmentRecord> persistentCommitteeReassignments;
}