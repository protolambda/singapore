import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/custody/custody_challenge.dart';


/// Custody data, challenges mainly. Stub in serenity phase 0.
mixin CustodyMeta on BlockMeta {

  Future<List<CustodyChallenge>> getCustodyChallenges() =>
      db.getData(MetaDataKey("custody_challenges", blockHash)).then(decodeCustodyChallenges);

  Future setCustodyChallenges(List<CustodyChallenge> value) =>
      db.putData(MetaDataKey("custody_challenges", blockHash), encodeCustodyChallenges(value));


  Future genesis() async {
    await super.genesis();
    await setCustodyChallenges([]);
  }

}
