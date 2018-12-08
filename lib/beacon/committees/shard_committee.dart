class ShardCommittee {
  /// Shard number
  int shard;

  /// Validator indices
  List<int> committee;

  /// Total validator count (for proofs of custody)
  int totalValidatorCount;
}
