import 'package:protolith/blockchain/hash.dart';

class AttestationData {
  /// Slot number
  int slot;

  /// Shard number
  int shard;

  /// Hash of the signed beacon block
  Hash256 beacon_block_hash;

  /// Hash of the ancestor at the epoch boundary
  Hash256 epoch_boundary_hash;

  /// Shard block hash being attested to
  Hash256 shard_block_hash;

  /// Last crosslink hash
  Hash256 latest_crosslink_hash;

  /// Slot of the last justified beacon block
  int justified_slot;

  /// Hash of the last justified beacon block
  Hash256 justified_block_hash;
}
