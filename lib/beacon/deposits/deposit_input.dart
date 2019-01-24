import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/crypto/BLSSignature.dart';

class DepositInput {

  // TODO BLS stuff
  /// BLS pubkey
  Uint8List pubKey;

  /// Withdrawal credentials
  Hash256 withdrawalCredentials;

  /// A BLS signature of this [DepositInput]
  BLSSignature proofOfPossession;

}