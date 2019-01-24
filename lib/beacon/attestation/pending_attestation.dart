import 'dart:typed_data';

import 'package:singapore/beacon/attestation/attestation_data.dart';

class PendingAttestation {
  /// Signed data
  AttestationData data;

  /// Attester aggregation bitfield
  Uint8List aggregationBitfield;

  /// Proof of custody bitfield
  Uint8List custodyBitfield;

  /// Slot in which it was included
  int slot_included;
}
