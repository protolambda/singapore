import 'dart:typed_data';
import 'dart:math' show min;

import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/validators/validator.dart';
import 'package:singapore/beacon/beacon_constants.dart';
import 'package:singapore/crypto/BLSPubKey.dart';
import 'package:singapore/crypto/BLSSignature.dart';

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

  void validateProofOfPossession() {
    // TODO spec
  }

  void processDeposit(BLSPubKey pubkey, int amount, BLSSignature proofOfPossession, Hash256 withdrawalCredentials) {
    // TODO spec
  }

  void activateValidator(int index, bool genesis) {
    // TODO spec
  }

  void initiateValidatorExit(int index) {
    // TODO spec
  }

  void exitValidator(int index) {
    // TODO spec
  }

  void penalizeValidator(int index) {
    // TODO spec
  }

  void prepareValidatorForWithdrawal(int index) {
    // TODO spec
  }

  void processEjections() {
    // TODO spec
  }

  void updateValidatorRegistry() {
    // TODO spec
  }

  void processPenaltiesAndExits() {
    // TODO spec
  }

}

ValidatorsData decodeValidatorsData(Uint8List data) => null;
Uint8List encodeValidatorsData(ValidatorsData data) => null;