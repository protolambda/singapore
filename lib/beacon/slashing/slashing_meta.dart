import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/beacon_constants.dart';
import 'package:protolith/crypto/data_util.dart';


mixin SlashingMeta on BlockMeta {

  /// Balances penalized at every withdrawal period
  Future<int> getLatestPenalizedBalance(int slot) =>
      db.getData(MetaDataKey("latest_penalized_balances", blockHash, [slot % LATEST_PENALIZED_EXIT_LENGTH])).then(decInt64);

  Future setLatestPenalizedBalance(int slot, int value) =>
      db.putData(MetaDataKey("latest_penalized_balances", blockHash, [slot % LATEST_PENALIZED_EXIT_LENGTH]), encInt64(value));


  Future genesis() async {
    await super.genesis();

    // initialize latest penalized balances
    await Future.wait(new List.generate(LATEST_PENALIZED_EXIT_LENGTH,
            (i) => setLatestPenalizedBalance(i, 0)));
  }

}