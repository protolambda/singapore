import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/finality/finality_data.dart';
import 'package:singapore/beacon/beacon_constants.dart';

mixin FinalityMeta on BlockMeta {

  Future<FinalityData> getFinalityData() =>
      db.getData(MetaDataKey("finality", blockHash)).then(decodeFinalityData);

  Future setFinalityData(FinalityData value) =>
      db.putData(MetaDataKey("finality", blockHash), encodeFinalityData(value));

  Future genesis() async {
    await super.genesis();
    await setFinalityData(
        FinalityData(GENESIS_SLOT, GENESIS_SLOT, 0, GENESIS_SLOT));
  }
}
