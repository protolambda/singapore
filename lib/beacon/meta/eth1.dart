import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/eth1/eth1_data.dart';
import 'package:singapore/beacon/eth1/eth1_data_vote.dart';

/// Ethereum 1.0 chain data
mixin Eth1 on BlockMeta {

  Eth1Data latestEth1Data;

  List<Eth1DataVote> eth1DataVotes;

}
