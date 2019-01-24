import 'dart:typed_data';

import 'package:singapore/beacon/attestation/attestation_data.dart';
import 'package:singapore/crypto/BLSSignature.dart';

class Attestation {

  /// Attestation data
  AttestationData data;

  /// Attester aggregation bitfield
  Uint8List aggregationBitfield;

  /// Proof of custody bitfield
  Uint8List custodyBitfield;

  /// BLS aggregate signature
  List<BLSSignature> aggregateSignature;
}
