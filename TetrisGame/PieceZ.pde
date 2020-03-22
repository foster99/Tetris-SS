// Pieza Z:    |x|x| | |
//             | |x|x| |
//             | | | | |
//             | | | | |

public class PieceZ extends Piece {
 
  PieceZ(Coord o) {
    super();
    origin = o;
    origin_backup = origin.clone();
    rotation = floor(random(0,1));
    portions = new Coord[4];
    portions_backup = new Coord[4];
    rotatePiece();
  }
  
  int[] getColor() {
    return new int[] {255,0,0}; // red
  }
  
  void rotatePiece() {
    
  // 0)  |0|1| | |  1) | |0| | |
  //     | |2|3| |     |2|1| | |
  //     | | | | |     |3| | | |
  //     | | | | |     | | | | |

    backup();
    rotation = (++rotation)%2;
    switch (rotation) {
      case 0:
        portions[0] = new Coord(0,0);
        portions[1] = new Coord(0,1);
        portions[2] = new Coord(1,1);
        portions[3] = new Coord(1,2);
        break;
        
      case 1:
        portions[0] = new Coord(0,1);
        portions[1] = new Coord(1,1);
        portions[2] = new Coord(1,0);
        portions[3] = new Coord(2,0);
        break;
        
      default: break;
    }
  }
  
}
