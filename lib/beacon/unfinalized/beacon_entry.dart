
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/unfinalized/dag/dag.dart';

class BeaconEntry extends DagNode<Hash256> {

  Hash256 blockHash;

  int slot;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BeaconEntry &&
              runtimeType == other.runtimeType &&
              blockHash == other.blockHash;

  @override
  int get hashCode => blockHash.hashCode;

  @override
  Hash256 get inwards => null;

  @override
  Hash256 get key => blockHash;

}