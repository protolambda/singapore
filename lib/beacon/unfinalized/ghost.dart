
import 'package:singapore/beacon/unfinalized/dag/dag.dart';
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';

typedef Future<int> ScoreFn<N>(N n);

/// GHOST: Greediest Heaviest Observed SubTree
class GHOST<N extends DagNode> extends ForkChoiceRule<N> {

  final ScoreFn<N> scoreFn;

  GHOST(this.scoreFn);

  @override
  Future<N> chooseNode(N prev, dagLvl) async {
    N best;
    int bestScore = 0;
    for (N n in dagLvl.levelNodes) {
      // only consider if the previous node is connected
      if (prev == null || n.inwards == prev.key) {
        int score = await scoreFn(n);
        if (score > bestScore) {
          bestScore = score;
          best = n;
        }
      }
    }
    return best;
  }

}