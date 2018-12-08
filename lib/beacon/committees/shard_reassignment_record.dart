class ShardReassignmentRecord {
  /// Which validator to reassign
  int validatorIndex;

  /// To which shard
  int shard;

  /// When
  int slot;
}
