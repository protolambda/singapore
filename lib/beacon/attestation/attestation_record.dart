import 'dart:typed_data';

import 'package:singapore/beacon/attestation/attestation_data.dart';
import 'package:singapore/crypto/BLSSignature.dart';

class AttestationRecord {

  /// Attestation data
  AttestationData data;

  /// Attester participation bitfield
  Uint8List participationBitfield;

  /// Proof of custody bitfield
  Uint8List custodyBitfield;

  /// BLS aggregate signature
  List<BLSSignature> aggregateSignature;
}
