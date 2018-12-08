import 'package:protolith/blockchain/hash.dart';

class CrossLinkRecord {
  /// Slot number
  int slot;

  /// Shard block hash
  Hash256 shardBlockHash;
}
