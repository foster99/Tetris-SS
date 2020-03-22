import java.util.*; 

class Board {
  
  private Coord position;       // Position of the board (relative to the viewport)
  
  private static final int anchura = 10;   // Altura of the board
  private static final int altura = 20+4;  // Length of the board, the first 4 rows are reserved.
  
  private Cell[][] cells;       // Matrix of the cells of the board
  private int score;            // Points obtained in the board
  private int lines;            // Lines cleared in the board
  private Piece current_piece;  // Piece currently in use
  private Piece next_piece;     // Next piece in the game
  
  public Board(int x, int y) {
    
    cells = new Cell[altura][anchura];
    position = new Coord(y,x);
    
    score = 0;
    lines = 0;
    
    for (int i = 0; i < altura; ++i)
      for (int j = 0; j < anchura; ++j)
        cells[i][j] = new Cell(j,i);
        
    current_piece = generatePiece();
    next_piece = generatePiece();
  }
  
  private Piece generatePiece() {

    Coord o = new Coord(anchura/2,4);
    Piece p; 
    
    switch (floor(random(0,7))) {
      case 0: p = new PieceL(o); break;
      case 1: p = new PieceJ(o); break;
      case 2: p = new PieceO(o); break;
      case 3: p = new PieceS(o); break;
      case 4: p = new PieceZ(o); break;
      case 5: p = new PieceT(o); break;
      case 6: p = new PieceI(o); break;
      default: throw new java.lang.IllegalArgumentException();
    }
    
    return p;
  }
  
  public void genNextPiece() {
    current_piece = next_piece;
    next_piece = generatePiece();
  }
  
  
/*  // Given a cell (x,y), check if it is occupied
  public boolean isOccupied(int i, int j) {
    
    if (j < 0 || j >= anchura)
      throw new java.lang.IllegalArgumentException();
    else if (i < 0 || i >= altura)
      throw new java.lang.IllegalArgumentException();
    
    return cells[i][j].isOccupied();
  }
*/
  
  public void move(String direction) {
    
    if (direction == "UP")
      current_piece.rotatePiece();
      
    current_piece.movePiece(direction, anchura, altura);
  }
  
  public boolean game() {
    
    Coord[] positions = current_piece.getCoords();
    int[] colors = current_piece.getColor();
    
    Coord aux;
    
    if (landed(positions)) {
      
      // Poner como ocupado las posiciones de la current_piece,
      for (int i = 0; i < 4; ++i) {
        aux = positions[i];
        if (aux.i < altura && aux.j < anchura) 
          cells[aux.i][aux.j].setOccupied(colors[0],colors[1],colors[2]);
        else
          println("LA PIEZA OCUPA UNA POSICION INVALIDA");
      }
      
      // Calcular puntuacion + lineas eliminadas
      calculateScore(fullRows());
      
      show();
      
      // Checkear el Game Over
      for (int i = 0; i < 4; ++i)
        for (int j = 0; j < anchura; ++j)
          if (cells[i][j].isOccupied())
            return false;
      
      current_piece = next_piece;
      next_piece = generatePiece();
      
    } else {
      
      // Poner como ocupado las posiciones de la current_piece,
      for (int i = 0; i < 4; ++i) {
        aux = positions[i];
        if (aux.i < altura && aux.j < anchura) 
          cells[aux.i][aux.j].setOccupied(colors[0],colors[1],colors[2]);
        else
          println("LA PIEZA OCUPA UNA POSICION INVALIDA");
      }
      
      show();
      
      // Quitar de ocupadas todas las piezas (se van a mover)
      for (Coord pos : positions)
          cells[pos.i][pos.j].clearOccupied();
      
    }
    
    return true;
  }
  
  private void calculateScore(int full) {
    score += full;
  }
 
  private boolean landed(Coord[] positions) {
    
    for (Coord pos : positions)
      if (pos.i == altura - 1 || pos.i + 1 < altura && cells[pos.i + 1][pos.j].isOccupied())
        return true;
    
    return false;
  }
  
  private int fullRows() {
    int full = 0;
    for (int i = 4; i < altura; ++i) {
      
      boolean occupied = true;
      for (int j = 0; j < anchura && occupied; ++j) {
        occupied = occupied && cells[i][j].isOccupied();
      }
      
      if (occupied) {
        
        ++full;
        ++lines;
        
        for (int j = 0; j < anchura; ++j)
          cells[i][j].clearOccupied();
        
        //Push down all the upper cells
        for (int ii = i; ii > 0; --ii)
          for (int j = 0; j < anchura; ++j)
            cells[ii][j].replace(cells[ii-1][j]);
            
        
        for (int j = 0; j < anchura; ++j)
          cells[0][j].clearOccupied();
      }
    }
    return full;
  }
  
  private void show() {
    for (int i = 4; i < altura; ++i) {
       for (int j = 0; j < anchura; ++j) {
         cells[i][j].show(position);
       }
    }
  }
  
  public int getScore() {
    return score;
  }
  
  public int getLines() {
    return lines;
  }
  
  public Piece getCurrentPiece() {
    return current_piece;
  }
  
  public Piece getNextPiece() {
    return next_piece;
  }
  
}
