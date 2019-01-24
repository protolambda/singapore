import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/validators/validator.dart';

mixin ValidatorRegistry on BlockMeta {
  /// Validator registry
  List<Validator> validatorRegistry;
  List<int> validatorBalances;
  int validatorRegistryUpdateSlot;
  int validatorRegistryExitCount;

  /// For light clients to track deltas
  Hash256 validatorRegistryDeltaChainTip;


  Hash256 getLatestAttestationTarget(Validator v) {
    // TODO get target
    return null;
  }
}
