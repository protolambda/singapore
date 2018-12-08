import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/crypto/BLSPubKey.dart';

class ValidatorRecord {
  /// BLS public key
  BLSPubKey pubkey;

  /// Withdrawal credentials
  Hash256 withdrawalCredentials;

  /// RANDAO commitment
  Hash256 randaoCommitment;

  /// Slots the proposer has skipped (i.e. layers of RANDAO expected)
  int randaoSkips;

  /// Balance in Gwei
  int balance;

  /// Status code
  int status;

  /// Slot when validator last changed status (or 0)
  int latestStatusChangeSlot;

  /// Exit counter when validator exited (or 0)
  int exitCount;
}
