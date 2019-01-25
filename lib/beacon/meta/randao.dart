import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:protolith/crypto/data_util.dart';
import 'package:singapore/beacon/beacon_constants.dart';

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

mixin Randao on BlockMeta {

  Future<RandaoData> getRandaoData() =>
      db.getData(MetaDataKey("randao", blockHash)).then(decodeRandaoData);

  Future setRandaoData(RandaoData value) =>
      db.putData(MetaDataKey("randao", blockHash), encodeRandaoData(value));


  Future<Hash256> getLatestRandaoMix(int slot) =>
      db.getData(MetaDataKey("randao_mix", blockHash, [slot % LATEST_RANDAO_MIXES_LENGTH])).then(decHash256);

  Future setLatestRandaoMix(int slot, Hash256 value) =>
      db.putData(MetaDataKey("randao_mix", blockHash, [slot % LATEST_RANDAO_MIXES_LENGTH]), value.uint8list);

  Future<Hash256> getLatestVdfOutput(int nr) =>
      db.getData(MetaDataKey("vdf_output", blockHash, [nr % LATEST_VDF_OUTPUTS_LENGTH])).then(decHash256);

  Future setLatestVdfOutput(int nr, Hash256 value) =>
      db.putData(MetaDataKey("vdf_output", blockHash, [nr % LATEST_VDF_OUTPUTS_LENGTH]), value.uint8list);
}