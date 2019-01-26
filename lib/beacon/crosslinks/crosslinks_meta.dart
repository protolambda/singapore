import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/crosslinks/crosslink.dart';
import 'package:singapore/beacon/beacon_constants.dart';

mixin CrosslinksMeta on BlockMeta {

  Future<Crosslink> getLatestCrosslinks(int slot) =>
      db.getData(MetaDataKey("crosslinks", blockHash, [slot % SHARD_COUNT])).then(decodeCrosslink);

  Future setLatestCrosslinks(int slot, Crosslink value) =>
      db.putData(MetaDataKey("crosslinks", blockHash, [slot % SHARD_COUNT]), encodeCrosslink(value));

  Future genesis() async {
    await super.genesis();

    // add a crosslink for each shard.
    await Future.wait(new List.generate(SHARD_COUNT,
            (i) => setLatestCrosslinks(i, Crosslink(GENESIS_SLOT, ZERO_HASH))));
  }

}
