import 'package:singapore/beacon/attestation/attestation_data.dart';
import 'package:singapore/crypto/BLSSignature.dart';

class SlashableVoteData {

  /// Validator indices with custody bit equal to 0
  List<int> custodyBit0Indices;
  /// Validator indices with custody bit equal to 1
  List<int> custodyBit1Indices;
  /// Attestation data
  AttestationData data;
  /// Aggregate signature
  BLSSignature aggregateSignature;
}
