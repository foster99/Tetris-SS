
  // Pieza T:  |1|2|3| |
  //           | |4| | |
  //           | | | | |
  //           | | | | |

class PieceT extends Piece {
  
  private Coord origin;       // 
  private int rotation = 0;   // 0 -> 1 -> 2 -> 3 -> 0 -> ...
  
  private ArrayList<Coord> portions;
  
  PieceT() {
    portions = new ArrayList<Coord>(4);
    portions.set(0,new Coord(0,0));
    portions.set(1,new Coord(1,0));
    portions.set(2,new Coord(2,0));
    portions.set(3,new Coord(1,1));
  }
  
}
