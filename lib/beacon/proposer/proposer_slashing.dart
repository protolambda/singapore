import 'package:singapore/beacon/proposer/proposal_signed_data.dart';
import 'package:singapore/crypto/BLSSignature.dart';

class ProposerSlashing {
  /// Proposer index
  int proposerIndex;
  /// First proposal data
  ProposalSignedData proposalData1;
  /// First proposal signature
  BLSSignature proposalSignature1;
  /// Second proposal data
  ProposalSignedData proposalData2;
  /// Second proposal signature
  BLSSignature proposalSignature2;
}
