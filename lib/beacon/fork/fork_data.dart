import 'dart:typed_data';

class ForkData {
  /// Previous fork version
  int previousVersion;

  /// Current fork version
  int currentVersion;

  /// Fork slot number
  int forkSlot;
}

// TODO
ForkData decodeForkData(Uint8List data) => null;
Uint8List encodeForkData(ForkData data) => null;
