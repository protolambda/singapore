
import 'package:protolith/blockchain/block/block.dart';
import 'package:singapore/beacon/beacon_block_meta.dart';
import 'package:singapore/beacon/custody/custody_challenge.dart';
import 'package:singapore/beacon/custody/custody_reseed.dart';
import 'package:singapore/beacon/custody/custody_response.dart';

mixin CustodyBlockData<M extends BeaconBlockMeta> on Block<M> {

  List<CustodyReseed> custodyReseeds;
  List<CustodyChallenge> custodyChallenges;
  List<CustodyResponse> custodyResponses;

}
