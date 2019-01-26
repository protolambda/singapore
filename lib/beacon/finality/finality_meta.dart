import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/finality/finality_data.dart';

mixin FinalityMeta on BlockMeta {

  Future<FinalityData> getFinalityData() =>
      db.getData(MetaDataKey("fork", blockHash)).then(decodeFinalityData);

  Future setFinalityData(FinalityData value) =>
      db.putData(MetaDataKey("fork", blockHash), encodeFinalityData(value));
}