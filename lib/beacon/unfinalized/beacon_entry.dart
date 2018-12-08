
import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block.dart';
import 'package:singapore/beacon/unfinalized/dag/dag.dart';

class BeaconEntry extends DagNode<Hash256> {

  BeaconBlock block;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BeaconEntry &&
              runtimeType == other.runtimeType &&
              block.hash == other.block.hash;

  @override
  int get hashCode => block.hashCode;

  @override
  Hash256 get inwards => null;

  @override
  Hash256 get key => block.hash;

}