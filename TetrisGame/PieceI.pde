
// Pieza J:    |x| | | |
//             |x| | | |
//             |x| | | |
//             |x| | | |

public class PieceJ extends Piece {
 
  PieceT(Coord o) {
    super();
    origin = o;
    rotation = floor(random(0,2));
  }
  
  int[] getColor() {
    return new int[] {166,0,255};
  }
  
  void rotatePiece() {
    
  // 0)  |0| | | |  1) |0|1|2|3|
  //     |1| | | |     | | | | |
  //     |2| | | |     | | | | |
  //     |3| | | |     | | | | |

    rotation = (++rotation)%2;
    switch (rotation) {
      case 0:
        portions[0].setCoord(0,0);
        portions[1].setCoord(1,0);
        portions[2].setCoord(2,0);
        portions[3].setCoord(3,0);
        break;
        
      case 1:
        portions[0].setCoord(0,0);
        portions[1].setCoord(0,1);
        portions[2].setCoord(0,2);
        portions[3].setCoord(0,3);
        break;
      default: break;
    }
  }
  
}
