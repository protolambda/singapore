import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/crosslinks/cross_link_record.dart';
import 'package:singapore/beacon/attestation/pending_attestation_record.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';

mixin RecentState on BeaconBlockMeta {

  List<CrossLinkRecord> latestCrossLinks;
  // Needed to process attestations, older to newer
  List<Hash256> latestBlockHashes;
  //  Balances penalized at every withdrawal period
  List<int> latestPenalizedExitBalances;
  List<PendingAttestationRecord> latest_attestations;
}