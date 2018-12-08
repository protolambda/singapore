import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/crosslinks/cross_link_record.dart';
import 'package:singapore/beacon/attestation/pending_attestation_record.dart';

mixin RecentState on BlockMeta {

  List<CrossLinkRecord> latestCrossLinks;
  // Needed to process attestations, older to newer
  List<Hash256> latestBlockHashes;
  //  Balances penalized at every withdrawal period
  List<int> latestPenalizedExitBalances;
  List<PendingAttestationRecord> latest_attestations;
}