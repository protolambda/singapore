import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/meta/finality.dart';
import 'package:singapore/beacon/meta/fork.dart';
import 'package:singapore/beacon/meta/pow_receipt_root.dart';
import 'package:singapore/beacon/meta/randao.dart';
import 'package:singapore/beacon/meta/recent_state.dart';
import 'package:singapore/beacon/meta/validator_registry.dart';

class BeaconBlockMeta extends BlockMeta
  with Finality, Fork, PowReceiptRoot, Randao, RecentState, ValidatorRegistry {

  // constant, but in meta to easily customize it per type of chain.
  final int EPOCH_LENGTH = 1 << 6;

  /// the current slot number
  int slot;

  /// the Unix time of the genesis beacon chain block at slot 0
  int genesisTime;

}
