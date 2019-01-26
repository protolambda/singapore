
import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';

class RandaoData {

  int previousEpochStartShard;
  int currentEpochStartShard;
  int previousEpochCalculationSlot;
  int currentEpochCalculationSlot;
  Hash256 previousEpochRandaoMix;
  Hash256 currentEpochRandaoMix;

  RandaoData(this.previousEpochStartShard, this.currentEpochStartShard,
      this.previousEpochCalculationSlot, this.currentEpochCalculationSlot,
      this.previousEpochRandaoMix, this.currentEpochRandaoMix);


}

// TODO
RandaoData decodeRandaoData(Uint8List data) => null;
Uint8List encodeRandaoData(RandaoData data) => null;
