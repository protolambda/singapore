import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/validators/validators_data.dart';
import 'package:singapore/beacon/beacon_constants.dart';

mixin ValidatorsMeta on BlockMeta {

  Future<ValidatorsData> getValidatorsData() =>
      db.getData(MetaDataKey("validators_data", blockHash)).then(decodeValidatorsData);

  Future setValidatorsData(ValidatorsData value) =>
      db.putData(MetaDataKey("validators_data", blockHash), encodeValidatorsData(value));

  Future genesis() async {
    await super.genesis();

    await setValidatorsData(ValidatorsData([], [], GENESIS_SLOT, 0, ZERO_HASH));
  }

}
