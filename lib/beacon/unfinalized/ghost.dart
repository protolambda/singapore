
import 'package:singapore/beacon/unfinalized/dag/dag.dart';
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';

/// GHOST: Greediest Heaviest Observed SubTree
class GHOST<N extends DagNode> extends ForkChoiceRule<N> {

  const GHOST();

  @override
  N chooseNode(N prev, dagLvl) {
    N best;
    int bestScore = -1;
    for (N n in dagLvl.levelNodes) {
      // only consider if the previous node is connected
      if (prev == null || n.inwards == prev.key) {
        if (n.outwards.length > bestScore) {
          bestScore = n.outwards.length;
          best = n;
        }
      }
    }
    return best;
  }

}