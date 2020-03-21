public abstract class Piece {
  
  protected Coord origin;
  protected int rotation;   // 0 -> 1 -> 2 -> 3 -> 0 -> ...
  protected Coord[] portions =  new Coord[4];
  
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
    
    return new Coord[] { Coord.sum(origin, portions[0]),
                         Coord.sum(origin, portions[1]),
                         Coord.sum(origin, portions[2]),
                         Coord.sum(origin, portions[3]) }; 
  }
  
}
