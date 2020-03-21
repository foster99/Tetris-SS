// Coordeanadas 2D
public class Coord {
    
    public int i;
    public int j;
    
    public Coord() {
      i = 0;
      j = 0;
    }

    public Coord(int i, int j) {
        this.i = i;
        this.j = j;
    }
    
    public void setCoord(int i, int j) {
        this.i = i;
        this.j = j;
    }
    
    public void sum(int di, int dj) {
      i += di;
      j += dj;
    }
    
    public void sum(Coord a) {
      i += a.i;
      j += a.j;
    }
    
    public Coord clone() {
      return new Coord(this.i, this.j); 
    }
    
    public Coord swap() {
      int aui = i;
      i = j;
      j = aui;
      
      return this;
    }
    
    public Coord getNewSum(Coord a) {
      
      return new Coord(this.i + a.i, this.j + a.j);
    }
    
}
