import 'package:protolith/blockchain/hash.dart';

class AttestationData {
  /// Slot number
  int slot;

  /// Shard number
  int shard;

  /// Hash of the signed beacon block
  Hash256 beaconBlockHash;

  /// Hash of the ancestor at the epoch boundary
  Hash256 epochBoundaryHash;

  /// Shard block hash being attested to
  Hash256 shardBlockHash;

  /// Last crosslink hash
  Hash256 latestCrosslinkHash;

  /// Slot of the last justified beacon block
  int justifiedSlot;

  /// Hash of the last justified beacon block
  Hash256 justifiedBlockHash;
}
