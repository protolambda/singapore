import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/attestation/pending_attestation_record.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/attestation/attestation_record.dart';

mixin Attestation<M extends BeaconBlockMeta> on Block<M> {
  List<AttestationRecord> attestations;

  void verifyAttestations(M meta) {
    // TODO: verify all the properties of the attestation.
  }

  void processAttestations(M meta) {
    this.attestations.forEach((attestation) {
      meta.latestAttestations.add(new PendingAttestationRecord()
        ..data = attestation.data
        ..participationBitfield = attestation.participationBitfield
        ..custodyBitfield = attestation.custodyBitfield
        ..slot_included = meta.slot);
    });
  }
}
