
// Pieza O:    |x|x| | |
//             |x|x| | |
//             | | | | |
//             | | | | |

public class PieceO extends Piece {
 
  PieceO(Coord o) {
    super();
    origin = o;
    rotation = 0;
    
    portions = new Coord[4];
    
    // Pieza O:    |0|1| | |
    //             |2|3| | |
    //             | | | | |
    //             | | | | |

    portions[0] = new Coord(0,0);
    portions[1] = new Coord(0,1);
    portions[2] = new Coord(1,0);
    portions[3] = new Coord(1,1);
    
  }
  
  int[] getColor() {
    return new int[] {247,255,0}; // yellow
  }
  
  void rotatePiece() {  
    // no hay rotaciones
    return;
  }
  
}
