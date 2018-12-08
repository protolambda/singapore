import 'package:singapore/beacon/beacon_block_meta.dart';

mixin Finality on BeaconBlockMeta {

  int previousJustifiedSlot;
  int justifiedSlot;
  int justificationBitfield;
  int finalizedSlot;
}