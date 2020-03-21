// Coordeanadas 2D
public class Coord {
    
    public int x;
    public int y;
    
    public Coord() {
      x = 0;
      y = 0;
    }

    public Coord(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public void setCoord(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public void sum(int dx, int dy) {
      x += dx;
      y += dy;
    }
    
    public void sum(Coord a) {
      x += a.x;
      y += a.y;
    }
    
    public Coord getNewSum(Coord a) {
      
      return new Coord(this.x + a.x, this.y + a.y);
    }
    
}
