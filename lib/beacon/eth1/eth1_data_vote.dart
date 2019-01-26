import 'dart:typed_data';

import 'package:singapore/beacon/eth1/eth1_data.dart';

class Eth1DataVote {

  /// Data being voted for
  Eth1Data eth1data;

  /// Vote count
  int voteCount;
}

List<Eth1DataVote> decodeEth1DataVotes(Uint8List data) => null;
Uint8List encodeEth1DataVotes(List<Eth1DataVote> data) => null;

