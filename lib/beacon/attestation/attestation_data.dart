import 'package:protolith/blockchain/hash.dart';

class AttestationData {
  /// Slot number
  int slot;

  /// Shard number
  int shard;

  /// Hash of the signed beacon block
  Hash256 beaconBlockRoot;

  /// Hash of the ancestor at the epoch boundary
  Hash256 epochBoundaryRoot;

  /// Shard block hash being attested to
  Hash256 shardBlockRoot;

  /// Last crosslink hash
  Hash256 latestCrosslinkRoot;

  /// Slot of the last justified beacon block
  int justifiedSlot;

  /// Hash of the last justified beacon block
  Hash256 justifiedBlockHash;
}
