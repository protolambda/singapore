import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/attestation/pending_attestation.dart';
import 'package:singapore/beacon/crosslinks/cross_link.dart';
import 'package:singapore/beacon/beacon_constants.dart';
import 'package:protolith/crypto/data_util.dart';

// TODO
CrossLink decodeCrossLink(Uint8List data) => null;
Uint8List encodeCrossLink(CrossLink data) => null;

List<PendingAttestation> decodePendingAttestations(Uint8List data) => null;
Uint8List encodePendingAttestations(List<PendingAttestation> data) => null;

mixin RecentStateMeta on BlockMeta {

  Future<CrossLink> getLatestCrossLinks(int slot) =>
      db.getData(MetaDataKey("crosslinks", blockHash, [slot % SHARD_COUNT])).then(decodeCrossLink);

  Future setLatestCrossLinks(int slot, CrossLink value) =>
      db.putData(MetaDataKey("crosslinks", blockHash, [slot % SHARD_COUNT]), encodeCrossLink(value));

  /// Needed to process attestations, older to newer
  Future<Hash256> getLatestBlockRoot(int blockHeight) =>
      db.getData(MetaDataKey("latest_blocks", blockHash, [blockHeight % LATEST_BLOCK_ROOTS_LENGTH])).then(decHash256);

  Future setLatestBlockRoot(int blockHeight, Hash256 value) =>
      db.putData(MetaDataKey("latest_blocks", blockHash, [blockHeight % LATEST_BLOCK_ROOTS_LENGTH]), value.uint8list);


  /// Balances penalized at every withdrawal period
  Future<int> getLatestPenalizedBalance(int slot) =>
      db.getData(MetaDataKey("penalized_balances", blockHash, [slot % LATEST_PENALIZED_EXIT_LENGTH])).then(decInt64);

  Future setLatestPenalizedBalance(int slot, int value) =>
      db.putData(MetaDataKey("penalized_balances", blockHash, [slot % LATEST_PENALIZED_EXIT_LENGTH]), encInt64(value));


  Future<List<PendingAttestation>> getLatestAttestations() =>
      db.getData(MetaDataKey("latest_attestations", blockHash)).then(decodePendingAttestations);

  Future setLatestAttestations(List<PendingAttestation> value) =>
      db.putData(MetaDataKey("latest_attestations", blockHash), encodePendingAttestations(value));

  Future<Hash256> getBatchedBlockRoot(int batchNr) =>
      db.getData(MetaDataKey("latest_blocks", blockHash, [batchNr])).then(decHash256);

  Future setBatchedBlockRoot(int batchNr, Hash256 value) =>
      db.putData(MetaDataKey("latest_blocks", blockHash, [batchNr]), value.uint8list);
}