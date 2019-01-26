import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/fork/fork_data.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';

mixin ForkMeta on BlockMeta {

  /// For versioning hard forks
  Future<ForkData> getForkData() =>
      db.getData(MetaDataKey("fork", blockHash)).then(decodeForkData);

  Future setForkData(ForkData value) =>
      db.putData(MetaDataKey("fork", blockHash), encodeForkData(value));

}
