import 'package:protolith/blockchain/hash.dart';

class ProposalSignedData {
  /// Slot number
  int slot;
  /// Shard number (`BEACON_CHAIN_SHARD_NUMBER` for beacon chain)
  int shard;
  /// Block's hash of root
  Hash256 blockRoot;
}