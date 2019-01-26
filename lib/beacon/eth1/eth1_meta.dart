import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';
import 'package:singapore/beacon/eth1/eth1_data.dart';
import 'package:singapore/beacon/eth1/eth1_data_vote.dart';


/// Ethereum 1.0 chain data
mixin Eth1Meta on BlockMeta {

  /// gets latest Eth1Data (there's only one)
  Future<Eth1Data> getEth1Data() =>
      db.getData(MetaDataKey("eth1_data", blockHash)).then(decodeEth1Data);

  Future setEth1Data(Eth1Data value) =>
      db.putData(MetaDataKey("eth1_data", blockHash), encodeEth1Data(value));


  Future<List<Eth1DataVote>> getEth1DataVotes() =>
      db.getData(MetaDataKey("eth1_data_votes", blockHash)).then(decodeEth1DataVotes);

  Future setEth1DataVotes(List<Eth1DataVote> value) =>
      db.putData(MetaDataKey("eth1_data_votes", blockHash), encodeEth1DataVotes(value));


  Future genesis() async {
    await super.genesis();
    await setEth1DataVotes([]);
  }

}
