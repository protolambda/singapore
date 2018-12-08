import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/validators/validator_record.dart';

mixin ValidatorRegistry on BlockMeta {
  /// Validator registry
  List<ValidatorRecord> validatorRegistry;
  int validatorRegistryLatestChangeSlot;
  int validatorRegistryExitCount;

  /// For light clients to track deltas
  Hash256 validatorRegistryDeltaChainTip;
}
