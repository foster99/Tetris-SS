// Coordeanadas 2D
static public class Coord {
    
    public int x;
    public int y;

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
    
    static public Coord sum(Coord a, Coord b) {
      return new Coord(a.x + b.x, a.y + b.y);
    }
    
    public Coord subs(Coord a, Coord b) {
      return new Coord(a.x - b.x, a.y - b.y);
    }
}
