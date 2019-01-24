
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';

abstract class DagNode<K> {

  /// key of this node
  K get key;

  /// key of node that this dag node is based on.
  K get inwards;

  /// keys of nodes that are based on this node.
  final Set<K> outwards = new Set();

}

/// A layered dag:
/// - Each node has one input and can have multiple outputs.
/// - Each node has a level (distance from first dag node)
/// - Level numbers can be any int.
/// - Nodes on the same level are considered to be of the same height, but may have very different paths leading up to them.
class Dag<K, N extends DagNode<K>> {

  final ForkChoiceRule forkChoiceRule;

  Map<K, N> nodes;

  Dag(this.forkChoiceRule);

  void addNode(N node) {
    nodes[node.key] = node;
    nodes[node.inwards].outwards.add(node.key);
  }

  Iterable<N> findPath(K start) sync* {
    N res = nodes[start];
    yield res;
    while (res.outwards.isNotEmpty) {
      res = this.forkChoiceRule.chooseNode(res, this);
      yield res;
    }
  }

}
