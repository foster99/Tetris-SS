
// Pieza J:    | |x| | |
//             | |x| | |
//             |x|x| | |
//             | | | | |

public class PieceJ extends Piece {
 
  PieceJ(Coord o) {
    super();
    origin = o;
    origin_backup = origin.clone();
    rotation = floor(random(0,4));
    portions = new Coord[4];
    portions_backup = new Coord[4];
    rotatePiece();
  }
  
  int[] getColor() {
    return new int[] {0,0,255};  // blue
  }
  
  void rotatePiece() {
    
  // 0)  | |0| | |  1) |3| | | |  2) |2|3| | |  3) |0|1|2| |
  //     | |1| | |     |2|1|0| |     |1| | | |     | | |3| |
  //     |3|2| | |     | | | | |     |0| | | |     | | | | |
  //     | | | | |     | | | | |     | | | | |     | | | | |
    
    backup();
    rotation = (++rotation)%4;
    switch (rotation) {
      case 0:
        portions[0] = new Coord(0,1);
        portions[1] = new Coord(1,1);
        portions[2] = new Coord(2,1);
        portions[3] = new Coord(2,0);
        break;
        
      case 1:
        portions[0] = new Coord(1,2);
        portions[1] = new Coord(1,1);
        portions[2] = new Coord(1,0);
        portions[3] = new Coord(0,0);
        break;
        
      case 2:
        portions[0] = new Coord(2,0);
        portions[1] = new Coord(1,0);
        portions[2] = new Coord(0,0);
        portions[3] = new Coord(0,1);
        break;
      
      case 3:
        portions[0] = new Coord(0,0);
        portions[1] = new Coord(0,1);
        portions[2] = new Coord(0,2);
        portions[3] = new Coord(1,2);
        break;
        
      default: break;
    }
  }
  
}
