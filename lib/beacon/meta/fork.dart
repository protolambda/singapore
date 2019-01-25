import 'dart:typed_data';

import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/forking/fork_data.dart';
import 'package:protolith/blockchain/db/meta_data/meta_data_db.dart';

// TODO
ForkData decodeForkData(Uint8List data) => null;
Uint8List encodeForkData(ForkData data) => null;

mixin Fork on BlockMeta {

  /// For versioning hard forks
  Future<ForkData> getForkData() =>
      db.getData(MetaDataKey("fork", blockHash)).then(decodeForkData);

  Future setForkData(ForkData value) =>
      db.putData(MetaDataKey("fork", blockHash), encodeForkData(value));

}
