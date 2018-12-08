import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/meta/finality.dart';
import 'package:singapore/beacon/meta/fork.dart';
import 'package:singapore/beacon/meta/pow_receipt_root.dart';
import 'package:singapore/beacon/meta/randao.dart';
import 'package:singapore/beacon/meta/recent_state.dart';
import 'package:singapore/beacon/meta/validator_registry.dart';

class BeaconBlockMeta extends BlockMeta
  with Finality, Fork, PowReceiptRoot, Randao, RecentState, ValidatorRegistry {

  /// the current slot number
  int slot;

  /// the Unix time of the genesis beacon chain block at slot 0
  int genesisTime;

  /*
  def get_updated_ancestor_hashes(latest_block: BeaconBlock,
                                latest_hash: Hash32) -> List[Hash32]:
    new_ancestor_hashes = copy.deepcopy(latest_block.ancestor_hashes)
    for i in range(32):
        if latest_block.slot % 2**i == 0:
            new_ancestor_hashes[i] = latest_hash
    return new_ancestor_hashes
   */

}
