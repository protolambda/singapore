import 'dart:typed_data';

import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/attestation/pending_attestation.dart';

List<PendingAttestation> decodePendingAttestations(Uint8List data) => null;
Uint8List encodePendingAttestations(List<PendingAttestation> data) => null;

mixin AttestationsMeta on BlockMeta {

  Future<List<PendingAttestation>> getLatestAttestations() =>
      db.getData(MetaDataKey("latest_attestations", blockHash)).then(decodePendingAttestations);

  Future setLatestAttestations(List<PendingAttestation> value) =>
      db.putData(MetaDataKey("latest_attestations", blockHash), encodePendingAttestations(value));

}