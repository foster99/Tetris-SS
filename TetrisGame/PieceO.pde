
// Pieza L:    |x|x| | |
//             |x|x| | |
//             | | | | |
//             | | | | |

public class PieceL extends Piece {
 
  PieceT(Coord o) {
    super();
    origin = o;
    rotation = 0;
    
    
    // Pieza L:    |0|1| | |
    //             |2|3| | |
    //             | | | | |
    //             | | | | |

    portions[0].setCoord(0,0);
    portions[1].setCoord(0,1);
    portions[2].setCoord(1,0);
    portions[3].setCoord(1,1);
    
  }
  
  int[] getColor() {
    return new int[] {247,255,0}; // yellow
  }
  
  void rotatePiece() {  
    // no hay rotaciones
    return;
  }
  
}
