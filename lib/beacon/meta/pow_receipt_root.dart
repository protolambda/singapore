import 'package:protolith/blockchain/hash.dart';
import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/pow/candidate_pow_receipt_root_record.dart';

mixin PowReceiptRoot on BlockMeta {

  Hash256 processedPowReceiptRoot;
  List<CandidatePoWReceiptRootRecord> candidatePowReceiptRoots;
}
