
import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';

class RandaoData {

  List<Hash256> latestRandaoMixes;
  List<Hash256> latestVdfOutputs;

  int previousEpochStartShard;
  int currentEpochStartShard;
  int previousEpochCalculationSlot;
  int currentEpochCalculationSlot;
  Hash256 previousEpochRandaoMix;
  Hash256 currentEpochRandaoMix;

}

// TODO
RandaoData decodeRandaoData(Uint8List data) => null;
Uint8List encodeRandaoData(RandaoData data) => null;
