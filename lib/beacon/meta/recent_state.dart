import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/attestation/pending_attestation.dart';
import 'package:singapore/beacon/crosslinks/cross_link.dart';

mixin RecentState on BlockMeta {

  List<CrossLink> latestCrossLinks;
  // Needed to process attestations, older to newer
  List<Hash256> latestBlockRoots;
  //  Balances penalized at every withdrawal period
  List<int> latestPenalizedBalances;
  List<PendingAttestation> latestAttestations;
  List<Hash256> batchedBlockRoots;
}