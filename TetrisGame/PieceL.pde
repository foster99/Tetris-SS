
// Pieza L:    |x| | | |
//             |x| | | |
//             |x|x| | |
//             | | | | |

public class PieceL extends Piece {
 
  PieceL(Coord o) {
    super();
    origin = o;
    rotation = floor(random(0,4));
    portions = new Coord[4];
    rotatePiece();
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
        portions[0] = new Coord(0,0);
        portions[1] = new Coord(1,0);
        portions[2] = new Coord(2,0);
        portions[3] = new Coord(2,1);
        break;
        
      case 1:
        portions[0] = new Coord(0,2);
        portions[1] = new Coord(0,1);
        portions[2] = new Coord(0,0);
        portions[3] = new Coord(1,0);
        break;
        
      case 2:
        portions[0] = new Coord(2,1);
        portions[1] = new Coord(1,1);
        portions[2] = new Coord(0,1);
        portions[3] = new Coord(0,0);
        break;
      
      case 3:
        portions[0] = new Coord(1,0);
        portions[1] = new Coord(1,1);
        portions[2] = new Coord(1,2);
        portions[3] = new Coord(0,2);
        break;
        
      default: break;
    }
  }
  
}
