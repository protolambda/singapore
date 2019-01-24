import 'package:protolith/blockchain/hash.dart';
import 'package:singapore/beacon/deposits/deposit_data.dart';

class Deposit {

  /// Branch in the deposit tree
  Hash256 branch;

  /// Index in the deposit tree
  int index;

  /// Data
  DepositData depositData;

}