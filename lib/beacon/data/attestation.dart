
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/attestation/attestation_record.dart';
import 'package:singapore/crypto/BLSSignature.dart';

mixin Attestation<M extends BeaconBlockMeta> on Block<M> {

  List<AttestationRecord> attestations;

  List<BLSSignature> signature;
}
