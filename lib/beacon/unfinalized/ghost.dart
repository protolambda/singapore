
import 'package:singapore/beacon/unfinalized/dag/dag.dart';
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';

typedef int ScoreFn<N>(N n);

/// GHOST: Greediest Heaviest Observed SubTree
class GHOST<K, N extends DagNode<K>> extends ForkChoiceRule<K, N> {

  final ScoreFn<N> scoreFn;

  GHOST(this.scoreFn);

  @override
  N chooseNode(N prev, Dag<K, N> dag) {
    N best;
    int bestScore = 0;
    for (K k in prev.outwards) {
      N n = dag.nodes[k];
      int score = scoreFn(n);
      if (score > bestScore) {
        bestScore = score;
        best = n;
      }
    }
    return best;
  }

}