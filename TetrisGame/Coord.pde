// Coordeanadas 2D
public class Coord {
    
    public int x;
    public int y;

    public Coord(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public Coord sum(Coord a, Coord b) {
      return new Coord(a.x + b.x, a.y + b.y);
    }
    
    public Coord subs(Coord a, Coord b) {
      return new Coord(a.x - b.x, a.y - b.y);
    }
}
