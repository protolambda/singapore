import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/crypto/BLSPubKey.dart';
import 'package:singapore/crypto/BLSSignature.dart';

class DepositInput {

  /// BLS pubkey
  BLSPubKey pubKey;

  /// Withdrawal credentials
  Hash256 withdrawalCredentials;

  /// A BLS signature of this [DepositInput]
  BLSSignature proofOfPossession;

}