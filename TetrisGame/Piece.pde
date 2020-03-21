import java.util.*; 
public abstract class Piece {
  
  protected Coord origin;
  protected int rotation;   // 0 -> 1 -> 2 -> 3 -> 0 -> ...
  protected Coord[] portions;
  
  abstract int[] getColor();
  abstract void rotatePiece();
  
  void movePiece(String dir, int maxi, int maxj) {
    
    switch (dir) {
      case "DOWN":
        if (origin.j < maxj) origin.sum(1,0);
        break;
      case "LEFT":
        if (origin.i > 0) origin.sum(0,-1);
        break;
      case "RIGHT":
        if (origin.i < maxi) origin.sum(0,1);
        break;
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
