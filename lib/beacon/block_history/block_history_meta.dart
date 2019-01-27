import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/beacon_constants.dart';
import 'package:protolith/crypto/data_util.dart';


mixin BlockHistoryMeta on BlockMeta {

  /// Needed to process attestations, older to newer
  Future<Hash256> getLatestBlockRoots(int blockHeight) =>
      db.getData(MetaDataKey("latest_blocks", blockHash, [blockHeight % LATEST_BLOCK_ROOTS_LENGTH])).then(decHash256);

  Future setLatestBlockRoots(int blockHeight, Hash256 value) =>
      db.putData(MetaDataKey("latest_blocks", blockHash, [blockHeight % LATEST_BLOCK_ROOTS_LENGTH]), value.uint8list);


  Future<Hash256> getBatchedBlockRoot(int batchNr) =>
      db.getData(MetaDataKey("batched_roots", blockHash, [batchNr])).then(decHash256);

  Future setBatchedBlockRoot(int batchNr, Hash256 value) =>
      db.putData(MetaDataKey("batched_roots", blockHash, [batchNr]), value.uint8list);


  Future genesis() async {
    await super.genesis();

    // initialize latest blocks
    await Future.wait(new List.generate(LATEST_BLOCK_ROOTS_LENGTH,
            (i) => setLatestBlockRoots(i, ZERO_HASH)));
    // nothing to set for batched block roots
    //  (access is by index, genesis = empty list)
  }

}