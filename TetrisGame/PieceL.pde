
// Pieza L:    |x| | | |
//             |x| | | |
//             |x|x| | |
//             | | | | |

public class PieceL extends Piece {
 
  PieceT(Coord o) {
    super();
    origin = o;
    rotation = floor(random(0,3));
  }
  
  int[] getColor() {
    return new int[] {255,155,0}; // orange
  }
  
  void rotatePiece() {
    
  // 0)  |0| | | |  1) |2|1|0| |  2) |3|2| | |  3) | | |3| |
  //     |1| | | |     |3| | | |     | |1| | |     |0|1|2| |
  //     |2|3| | |     | | | | |     | |0| | |     | | | | |
  //     | | | | |     | | | | |     | | | | |     | | | | |

    rotation = (++rotation)%4;
    switch (rotation) {
      case 0:
        portions[0].setCoord(0,0);
        portions[1].setCoord(1,0);
        portions[2].setCoord(2,0);
        portions[3].setCoord(2,1);
        break;
        
      case 1:
        portions[0].setCoord(0,2);
        portions[1].setCoord(0,1);
        portions[2].setCoord(0,0);
        portions[3].setCoord(1,0);
        break;
        
      case 2:
        portions[0].setCoord(2,1);
        portions[1].setCoord(1,1);
        portions[2].setCoord(0,1);
        portions[3].setCoord(0,0);
        break;
      
      case 3:
        portions[0].setCoord(1,0);
        portions[1].setCoord(1,1);
        portions[2].setCoord(1,2);
        portions[3].setCoord(0,2);
        break;
        
      default: break;
    }
  }
  
}
