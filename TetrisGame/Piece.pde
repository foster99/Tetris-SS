import java.util.*; 
public abstract class Piece {
  
  protected Coord origin;
  protected int rotation;   // 0 -> 1 -> 2 -> 3 -> 0 -> ...
  protected Coord[] portions;
  
  abstract int[] getColor();
  abstract void rotatePiece();
  
  void movePiece(String dir) {
    switch (dir) {
      case "UP": origin.sum(0,-1); break;
      case "DOWN": origin.sum(0,1); break;
      case "LEFT": origin.sum(-1,0); break;
      case "RIGHT": origin.sum(1,0); break;
      default: break;
    }
  }
  
  Coord[] getCoords() {
    
    return new Coord[] { origin.getNewSum(portions[0]),
                         origin.getNewSum(portions[1]),
                         origin.getNewSum(portions[2]),
                         origin.getNewSum(portions[3]) }; 
  }
  
}
