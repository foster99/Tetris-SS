class Cell {
  private static final int size= 40;
 
  private boolean Occupied;
  private Coord cord;
  private int[] col;
  
  Cell(int x, int y) {
    Occupied=false;
    cord= new Coord(x,y);
    col= new int[3];
  }
  
  public boolean isOccupied(){
    return Occupied;
  }
  
  public void setOccupied(){
    Occupied=true;
  }
  
  public void clearOccupied(){
    Occupied=false;
  }
  
  public Coord getCoord(){
    return cord;
  }
  
  public void setColor(int R, int G, int B){
    col[0]=R;
    col[1]=G;
    col[2]=B;
  }
  
  void show() {
    fill(color(col[0],col[1],col[2]));
    rect(cord.x,cord.y,size,size);
  }
  
}
