
// Pieza I:    |x| | | |
//             |x| | | |
//             |x| | | |
//             |x| | | |

public class PieceI extends Piece {
 
  PieceI(Coord o) {
    super();
    origin = o;
    origin_backup = origin.clone();
    rotation = floor(random(0,2));
    portions = new Coord[4];
    portions_backup = new Coord[4];
    rotatePiece();
  }
  
  int[] getColor() {
    return new int[] {0,247,255}; // cyan
  }
  
  void rotatePiece() {
    
  // 0)  |0| | | |  1) |0|1|2|3|
  //     |1| | | |     | | | | |
  //     |2| | | |     | | | | |
  //     |3| | | |     | | | | |
    backup();
    rotation = (++rotation)%2;
    switch (rotation) {
      case 0:
        portions[0] = new Coord(0,0);
        portions[1] = new Coord(1,0);
        portions[2] = new Coord(2,0);
        portions[3] = new Coord(3,0);
        break;
        
      case 1:
        portions[0] = new Coord(0,0);
        portions[1] = new Coord(0,1);
        portions[2] = new Coord(0,2);
        portions[3] = new Coord(0,3);
        break;
      default: break;
    }
  }
  
}
