
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';

abstract class DagNode<K> {

  /// key of this node
  K get key;

  /// key of node that this dag node is based on.
  K get inwards;

  /// keys of nodes that are based on this node.
  final Set<K> outwards = new Set();

}

typedef bool RemoveCondition<K, N extends DagNode<K>>(K key, N node);

/// A DAG, with one origin "genesis" node
/// Each node in the DAG can only have one inwards "parent" node.
/// Nodes can have multiple outwards "children" nodes.
class Dag<K, N extends DagNode<K>> {

  final ForkChoiceRule forkChoiceRule;

  Map<K, N> nodes;

  Dag(this.forkChoiceRule);

  void addNode(N node) {
    nodes[node.key] = node;
    if (node.inwards != null) {
      N parent = nodes[node.inwards];
      if (parent == null)
        throw Exception("Cannot add node, parent node is not known.");
      parent.outwards.add(node.key);
    } else {
      if (nodes.isNotEmpty)
        throw Exception("Cannot add a second genesis node.");
    }
  }

  Iterable<N> findPath(K start) sync* {
    N res = nodes[start];
    yield res;
    while (res.outwards.isNotEmpty) {
      res = this.forkChoiceRule.chooseNode(res, this);
      yield res;
    }
  }

  /// Cleanup the DAG, remove nodes that satisfy the given [condition]
  void cleanup(RemoveCondition<K, N> condition) {
    nodes.removeWhere(condition);
  }

}
