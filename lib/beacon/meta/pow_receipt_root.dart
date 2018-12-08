import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/pow/candidate_pow_receipt_root_record.dart';

mixin Fork on BeaconBlockMeta {

  Hash256 processedPowReceiptRoot;
  List<CandidatePoWReceiptRootRecord> candidatePowReceiptRoots;
}
