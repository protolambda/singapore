import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';

class CrossLink {

  /// Slot number
  int slot;

  /// Shard block hash
  Hash256 shardBlockRoot;

}

// TODO
CrossLink decodeCrossLink(Uint8List data) => null;
Uint8List encodeCrossLink(CrossLink data) => null;
