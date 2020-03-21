class Cell {
  private static final int size= 40;
 
  private boolean Occupied;
  private Coord cord;
  private int[] col;
  
  Cell(int x, int y) {
    Occupied=false;
    cord= new Coord(x,y);
    col= new int[3];
    setColor(255,255,255);
  }
  
  public boolean isOccupied(){
    return Occupied;
  }
  
  public void setOccupied(int R, int G, int B){
    Occupied=true;
    setColor(R,G,B);
  }
  
  public void clearOccupied(){
    Occupied=false;
    setColor(255,255,255);
  }
  
  public Coord getCoord(){
    return cord;
  }
  
  public void setColor(int R, int G, int B){
    col[0]=R;
    col[1]=G;
    col[2]=B;
  }
  
  void show(Coord C) {
    fill(color(col[0],col[1],col[2]));
    rect(cord.x+C.x,cord.y+C.y,size,size);
  }
  
}
