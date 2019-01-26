
import 'dart:typed_data';

import 'package:protolith/blockchain/hash.dart';

class Eth1Data {

  /// Root of the deposit tree
  Hash256 depositRoot;

  /// Block hash
  Hash256 blockHash;

}

Eth1Data decodeEth1Data(Uint8List data) => null;
Uint8List encodeEth1Data(Eth1Data data) => null;
