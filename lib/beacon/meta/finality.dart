import 'dart:typed_data';

import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';

class FinalityData {

  int previousJustifiedSlot;
  int justifiedSlot;
  int justificationBitfield;
  int finalizedSlot;

}

FinalityData decodeFinalityData(Uint8List data) => null;
Uint8List encodeFinalityData(FinalityData data) => null;

mixin FinalityMeta on BlockMeta {

  Future<FinalityData> getFinalityData() =>
      db.getData(MetaDataKey("fork", blockHash)).then(decodeFinalityData);

  Future setFinalityData(FinalityData value) =>
      db.putData(MetaDataKey("fork", blockHash), encodeFinalityData(value));
}