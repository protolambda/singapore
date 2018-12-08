
import 'package:singapore/beacon/unfinalized/dag/fork_choice.dart';

abstract class DagNode<K> {

  /// key of this node
  K get key;

  /// key of node that this dag node is based on.
  K get inwards;

  /// keys of nodes that are based on this node.
  final Set<K> outwards = new Set();

  /// The depth of this node.
  int level;
}

class DagLevel<N extends DagNode> {

  final int level;

  final Set<N> levelNodes = new Set();

  DagLevel(this.level);
}

/// A layered dag:
/// - Each node has one input and can have multiple outputs.
/// - Each node has a level (distance from first dag node)
/// - Level numbers can be any int.
/// - Nodes on the same level are considered to be of the same height, but may have very different paths leading up to them.
class Dag<N extends DagNode> {

  List<DagLevel<N>> _levels = [];

  final ForkChoiceRule forkChoiceRule;

  int get minLevel => _levels.isEmpty ? null : _levels.first.level;
  int get maxLevel => _levels.isEmpty ? null : _levels.last.level;

  Dag(this.forkChoiceRule);

  DagLevel<N> operator [](int level) {
    if (_levels.isEmpty) throw Exception("No dag levels available");
    if (_levels.first.level > level) throw Exception("Level too early, not included. First level is ${_levels.first.level}");
    if (_levels.last.level <= level) throw Exception("Level too late, not included. Last level is ${_levels.last.level}");
    return _levels[level - _levels.first.level];
  }

  void addToLevel(DagNode node) {
    if (_levels.isEmpty || _levels.last.level + 1 == node.level) {
      _levels.add(new DagLevel<N>(node.level)..levelNodes.add(node));
      return;
    }

    this[node.level].levelNodes.add(node);

    // if it's not the first level, then we can connect this node to the previous level.
    if (node.level == _levels.first.level) return;

    DagLevel prevLvl = this[node.level - 1];
    for (N p in prevLvl.levelNodes) {
      if (node.inwards == p.key) {
        p.outwards.add(node);
      }
    }
  }

  Iterable<N> findPath({int maxLevel: null}) sync* {
    if (maxLevel == null) maxLevel = _levels.length;
    N prev = null;
    for (int i = 0; i < maxLevel; i++) {
      N chosen = this.forkChoiceRule.chooseNode(prev, _levels[i]);
      yield chosen;
      prev = chosen;
    }
  }

}
