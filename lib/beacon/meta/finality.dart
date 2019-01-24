import 'package:protolith/blockchain/meta/blocks/meta.dart';

mixin Finality on BlockMeta {

  int previousJustifiedSlot;
  int justifiedSlot;
  int justificationBitfield;
  int finalizedSlot;

}