
// Pieza T:    |x|x|x| |
//             | |x| | |
//             | | | | |
//             | | | | |

public class PieceT extends Piece {
 
  PieceT(Coord o) {
    super();
    origin = o;
    rotation = floor(random(0,4));
  }
  
  int[] getColor() {
    return new int[] {166,0,255}; // purple
  }
  
  void rotatePiece() {
    
  // 0)  |0|1|2| |  1) | |0| | |  2) | |3| | |  3) |0| | | |
  //     | |3| | |     |3|1| | |     |2|1|0| |     |1|3| | |
  //     | | | | |     | |2| | |     | | | | |     |2| | | |
  //     | | | | |     | | | | |     | | | | |     | | | | |

    rotation = (++rotation)%4;
    switch (rotation) {
      case 0:
        portions[0].setCoord(0,0);
        portions[1].setCoord(0,1);
        portions[2].setCoord(0,2);
        portions[3].setCoord(1,1);
        break;
        
      case 1:
        portions[0].setCoord(0,1);
        portions[1].setCoord(1,1);
        portions[2].setCoord(2,1);
        portions[3].setCoord(1,0);
        break;
        
      case 2:
        portions[0].setCoord(1,2);
        portions[1].setCoord(1,1);
        portions[2].setCoord(1,0);
        portions[3].setCoord(0,1);
        break;
      
      case 3:
        portions[0].setCoord(0,0);
        portions[1].setCoord(1,0);
        portions[2].setCoord(2,0);
        portions[3].setCoord(1,1);
        break;
        
      default: break;
    }
  }
  
}
