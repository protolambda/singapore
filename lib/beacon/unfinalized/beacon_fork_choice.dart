import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/beacon_block_chain.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/unfinalized/beacon_entry.dart';
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';
import 'package:singapore/beacon/unfinalized/ghost.dart';
import 'package:singapore/beacon/validators/validator_record.dart';

ForkChoiceRule getLmdGhost(BeaconBlockMeta state) => GHOST<BeaconEntry>((BeaconEntry entry) async {
  List<ValidatorRecord> validators = state.validatorRegistry;

  List<ValidatorRecord> activeValidators =
      validators.where(isValidatorActive).toList();

  List<BeaconBlock> attestationTargets =
      activeValidators.map((v) => getLatestAttestationTarget(state, v));

  return (await Future.wait(attestationTargets.map((target) async {
    // TODO: fix missing vars here
    return (await getAncestor(null, target, entry.block.slot)).hash ==
        entry.block.hash;
  })))
      .length;
});

bool isValidatorActive(ValidatorRecord v) =>
    (v.status == ValidatorRecordStatus.ACTIVE_PENDING_EXIT ||
        v.status == ValidatorRecordStatus.ACTIVE);

// TODO get latest attestation
BeaconBlock getLatestAttestationTarget(
        BeaconBlockMeta meta, ValidatorRecord v) =>
    null;

Future<BeaconBlock> getAncestor(
        BeaconBlockChain chain, BeaconBlock block, int slot) async =>
    block.slot == slot
        ? block
        : (await getAncestor(chain, await chain.getBlock(block.parentHash), slot));
