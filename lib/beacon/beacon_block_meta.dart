import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/meta/finality.dart';
import 'package:singapore/beacon/meta/fork.dart';
import 'package:singapore/beacon/meta/pow_receipt_root.dart';
import 'package:singapore/beacon/meta/randao.dart';
import 'package:singapore/beacon/meta/recent_state.dart';
import 'package:singapore/beacon/meta/validator_registry.dart';

class BeaconBlockMeta extends BlockMeta
  with Finality, Fork, PowReceiptRoot, Randao, RecentState, ValidatorRegistry {

  /// TODO move to storage
  /// the current slot number
  int slot;

  BeaconBlockMeta(Hash256 hash, int blockNum, MetaDataDB db)
      : super(hash, blockNum, db);
}
