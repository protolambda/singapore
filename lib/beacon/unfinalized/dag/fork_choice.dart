
import 'package:singapore/beacon/unfinalized/dag/dag.dart';

abstract class ForkChoiceRule<K, N extends DagNode<K>> {

  ForkChoiceRule();

  /// Decide on a node to form a path.
  N chooseNode(N prev, Dag<K, N> dag);

}