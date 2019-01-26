
import 'dart:typed_data';

class FinalityData {

  int previousJustifiedSlot;
  int justifiedSlot;
  int justificationBitfield;
  int finalizedSlot;

  FinalityData(this.previousJustifiedSlot, this.justifiedSlot,
      this.justificationBitfield, this.finalizedSlot);

}

// TODO
FinalityData decodeFinalityData(Uint8List data) => null;
Uint8List encodeFinalityData(FinalityData data) => null;
