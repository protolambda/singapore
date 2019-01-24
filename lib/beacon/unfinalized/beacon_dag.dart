
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/unfinalized/beacon_entry.dart';
import 'package:singapore/beacon/unfinalized/dag/dag.dart';
import 'package:singapore/beacon/unfinalized/ghost.dart';
import 'package:singapore/beacon/validators/validator.dart';

class BeaconDag extends Dag<Hash256, BeaconEntry> {

  BeaconDag() : super(GHOST<Hash256, BeaconEntry>((BeaconEntry entry) => entry.votes));

  void _resetVote(BeaconEntry node) {
    node.votes = 0;
  }

  void _vote(BeaconEntry node) {
    if (node == null) return;
    node.votes++;
    _vote(nodes[node.inwards]);
  }

  Future updateDagVotes(BeaconBlockMeta meta) async {

    List<Validator> validators = meta.validatorRegistry;

    List<Validator> activeValidators = validators.where((v) => v.isActive(meta.slot)).toList();

    // Get the last attested block of each validator (= LMD part),
    //  these will be the votes for a particular path of blocks.
    List<Hash256> attestationTargets = activeValidators.map((v) => meta.getLatestAttestationTarget(v));

    // reset all votes
    nodes.values.forEach(_resetVote);

    // Make each target vote for their ancestor path.
    attestationTargets.map((h) => nodes[h]).forEach(_vote);
  }


}