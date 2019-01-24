import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';

mixin Randao on BlockMeta {

  List<Hash256> latestRandaoMixes;
  List<Hash256> latestVdfOutputs;
  
  int previousEpochStartShard;
  int currentEpochStartShard;
  int previousEpochCalculationSlot;
  int currentEpochCalculationSlot;
  Hash256 previousEpochRandaoMix;
  Hash256 currentEpochRandaoMix;

}