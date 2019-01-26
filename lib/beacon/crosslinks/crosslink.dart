import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';

class Crosslink {

  /// Slot number
  int slot;

  /// Shard block hash
  Hash256 shardBlockRoot;

  Crosslink(this.slot, this.shardBlockRoot);

}

// TODO
Crosslink decodeCrosslink(Uint8List data) => null;
Uint8List encodeCrosslink(Crosslink data) => null;
