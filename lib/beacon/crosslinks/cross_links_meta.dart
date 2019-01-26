import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/crosslinks/cross_link.dart';
import 'package:singapore/beacon/beacon_constants.dart';

mixin CrossLinksMeta on BlockMeta {

  Future<CrossLink> getLatestCrossLinks(int slot) =>
      db.getData(MetaDataKey("crosslinks", blockHash, [slot % SHARD_COUNT])).then(decodeCrossLink);

  Future setLatestCrossLinks(int slot, CrossLink value) =>
      db.putData(MetaDataKey("crosslinks", blockHash, [slot % SHARD_COUNT]), encodeCrossLink(value));

  Future genesis() async {
    await super.genesis();

    // add a crosslink for each shard.
    await Future.wait(new List.generate(SHARD_COUNT,
            (i) => setLatestCrossLinks(i, CrossLink(GENESIS_SLOT, ZERO_HASH))));
  }

}
