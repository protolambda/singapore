import 'package:singapore/crypto/BLSSignature.dart';

class Exit {
  /// Minimum slot for processing exit
  int slot;
  /// Index of the exiting validator
  int validatorIndex;
  /// Validator signature
  BLSSignature signature;
}