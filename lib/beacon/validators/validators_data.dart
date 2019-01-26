import 'dart:typed_data';
import 'dart:math' show min;

import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/validators/validator.dart';
import 'package:singapore/beacon/beacon_constants.dart';

class ValidatorsData {

  /// Validator registry
  List<Validator> validatorRegistry;
  List<int> validatorBalances;
  int validatorRegistryUpdateSlot;
  int validatorRegistryExitCount;

  /// For light clients to track deltas
  Hash256 validatorRegistryDeltaChainTip;

  ValidatorsData(
      this.validatorRegistry,
      this.validatorBalances,
      this.validatorRegistryUpdateSlot,
      this.validatorRegistryExitCount,
      this.validatorRegistryDeltaChainTip);

  Hash256 getLatestAttestationTarget(Validator v) {
    // TODO get target
    return null;
  }

  void shuffle() {
    // TODO shuffle validators
  }

  /// Returns the effective balance (also known as "balance at stake") for a `validator` with the given [index].
  int getEffectiveBalance(int index) {
    return min(validatorBalances[index], MAX_DEPOSIT_AMOUNT);
  }
}

ValidatorsData decodeValidatorsData(Uint8List data) => null;
Uint8List encodeValidatorsData(ValidatorsData data) => null;