import 'dart:typed_data';

import 'package:singapore/beacon/attestation/attestation_data.dart';

class PendingAttestationRecord {
  /// Signed data
  AttestationData data;

  /// Attester participation bitfield
  Uint8List participationBitfield;

  /// Proof of custody bitfield
  Uint8List custodyBitfield;

  /// Slot in which it was included
  int slot_included;
}
