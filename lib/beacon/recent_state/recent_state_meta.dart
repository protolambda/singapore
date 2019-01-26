import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/beacon_constants.dart';
import 'package:protolith/crypto/data_util.dart';


mixin RecentStateMeta on BlockMeta {

  /// Needed to process attestations, older to newer
  Future<Hash256> getLatestBlockRoots(int blockHeight) =>
      db.getData(MetaDataKey("latest_blocks", blockHash, [blockHeight % LATEST_BLOCK_ROOTS_LENGTH])).then(decHash256);

  Future setLatestBlockRoots(int blockHeight, Hash256 value) =>
      db.putData(MetaDataKey("latest_blocks", blockHash, [blockHeight % LATEST_BLOCK_ROOTS_LENGTH]), value.uint8list);


  /// Balances penalized at every withdrawal period
  Future<int> getLatestPenalizedBalance(int slot) =>
      db.getData(MetaDataKey("latest_penalized_balances", blockHash, [slot % LATEST_PENALIZED_EXIT_LENGTH])).then(decInt64);

  Future setLatestPenalizedBalance(int slot, int value) =>
      db.putData(MetaDataKey("latest_penalized_balances", blockHash, [slot % LATEST_PENALIZED_EXIT_LENGTH]), encInt64(value));


  Future<Hash256> getBatchedBlockRoot(int batchNr) =>
      db.getData(MetaDataKey("latest_blocks", blockHash, [batchNr])).then(decHash256);

  Future setBatchedBlockRoot(int batchNr, Hash256 value) =>
      db.putData(MetaDataKey("latest_blocks", blockHash, [batchNr]), value.uint8list);


  Future genesis() async {
    await super.genesis();

    // initialize latest blocks
    await Future.wait(new List.generate(LATEST_BLOCK_ROOTS_LENGTH,
            (i) => setLatestBlockRoots(i, ZERO_HASH)));
    // initialize latest penalized balances
    await Future.wait(new List.generate(LATEST_PENALIZED_EXIT_LENGTH,
            (i) => setLatestPenalizedBalance(i, 0)));
    // nothing to set for batched block roots
    //  (access is by index, genesis = empty list)
  }

}