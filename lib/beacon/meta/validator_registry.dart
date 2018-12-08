import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/validators/validator_record.dart';

mixin ValidatorRegistry on BeaconBlockMeta {
  /// Validator registry
  List<ValidatorRecord> validatorRegistry;
  int validatorRegistryLatestChangeSlot;
  int validatorRegistryExitCount;

  /// For light clients to track deltas
  Hash256 validatorRegistryDeltaChainTip;
}
