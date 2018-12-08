
import 'package:singapore/beacon/unfinalized/dag/dag.dart';

abstract class ForkChoiceRule<N extends DagNode> {

  const ForkChoiceRule();

  /// Decide on a node for a dag-level to form a path.
  /// [prev] may be null, the fork-choice rule can assume
  ///  that it does not matter which node is picked in this case.
  N chooseNode(N prev, DagLevel<N> dagLvl);
}