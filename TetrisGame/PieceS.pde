// Pieza S:    | |x|x| |
//             |x|x| | |
//             | | | | |
//             | | | | |

public class PieceS extends Piece {
 
  PieceS(Coord o) {
    super();
    origin = o;
    rotation = floor(random(0,1));
    portions = new Coord[4];
    rotatePiece();
  }
  
  int[] getColor() {
    return new int[] {0,255,0}; // green
  }
  
  void rotatePiece() {
    
  // 0)  | |2|3| |  1) |0| | | |
  //     |0|1| | |     |1|2| | |
  //     | | | | |     | |3| | |
  //     | | | | |     | | | | |

    rotation = (++rotation)%2;
    switch (rotation) {
      case 0:
        portions[0].setCoord(1,0);
        portions[1].setCoord(1,1);
        portions[2].setCoord(0,1);
        portions[3].setCoord(0,2);
        break;
        
      case 1:
        portions[0].setCoord(0,0);
        portions[1].setCoord(1,0);
        portions[2].setCoord(1,1);
        portions[3].setCoord(2,1);
        break;
        
      default: break;
    }
  }
  
}
