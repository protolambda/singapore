import 'package:protolith/blockchain/meta/blocks/meta.dart';
import 'package:singapore/beacon/forking/fork_data.dart';

mixin Fork on BlockMeta {

  /// For versioning hard forks
  ForkData fork;

}
