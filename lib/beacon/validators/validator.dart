import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/crypto/BLSPubKey.dart';

class Validator {
  /// BLS public key
  BLSPubKey pubkey;

  /// Withdrawal credentials
  Hash256 withdrawalCredentials;
  
  // Number of proposer slots since genesis
  int proposer_slots;
  // Slot when validator activated
  int activation_slot;
  // Slot when validator exited
  int exit_slot;
  // Slot when validator withdrew
  int withdrawal_slot;
  // Slot when validator was penalized
  int penalized_slot;
  // Exit counter when validator exited
  int exit_count;
  // Status flags
  int status_flags;
  // Slot of latest custody reseed
  int latest_custody_reseed_slot;
  // Slot of second-latest custody reseed
  int penultimate_custody_reseed_slot;

  /// Checks if this is an active validator for the given [slot].
  bool isActive(int slot) => activation_slot <= slot && slot < exit_slot;

}
