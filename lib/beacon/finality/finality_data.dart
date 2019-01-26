
import 'dart:typed_data';

class FinalityData {

  int previousJustifiedSlot;
  int justifiedSlot;
  int justificationBitfield;
  int finalizedSlot;

}

// TODO
FinalityData decodeFinalityData(Uint8List data) => null;
Uint8List encodeFinalityData(FinalityData data) => null;
