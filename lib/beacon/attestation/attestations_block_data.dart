import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/attestation/attestation.dart';

mixin AttestationsBlockData<M extends BeaconBlockMeta> on Block<M> {
  List<Attestation> attestations;

  void verifyAttestations(M meta) {
    // TODO: verify all the properties of the attestation.
  }

  void processAttestations(M meta) {
    // TODO add to latest attestations
//    this.attestations.forEach((attestation) async {
//      .add(new PendingAttestation()
//        ..data = attestation.data
//        ..aggregationBitfield = attestation.aggregationBitfield
//        ..custodyBitfield = attestation.custodyBitfield
//        ..slot_included = meta.slot);
//    });
  }
}
