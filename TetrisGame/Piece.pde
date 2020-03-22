import java.util.*; 
public abstract class Piece {
  
  
  protected int rotation;
  protected Coord origin;
  protected Coord[] portions;
  
  protected int rotation_backup;
  protected Coord origin_backup;
  protected Coord[] portions_backup;
  
  abstract int[] getColor();
  abstract void rotatePiece();
  
  private boolean init = true;
  
  void rollback() {
    
    rotation = rotation_backup;
    origin = origin_backup.clone();
    for (int i = 0; i < 4; ++i)
      portions[i] = portions_backup[i].clone();
  }
  
  void backup() {
    if (init) { // primera iteracion no se hace backup
      init = false;
      return;
    }
    rotation_backup = rotation;
    origin_backup = origin.clone();
    for (int i = 0; i < 4; ++i)
      portions_backup[i] = portions[i].clone();
  }
  
  void movePiece(String dir, int anchura, int altura) {
    
    backup();
    
    switch (dir) {
      case "DOWN":
        origin.sum(1,0);
        break;
      case "LEFT":
        origin.sum(0,-1);
        break;
      case "RIGHT":
        origin.sum(0,1);
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
