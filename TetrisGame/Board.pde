import java.util.*; 

class Board {
  public Board(int x, int y) {
    cells = new Cell[altura][anchura];
    position = new Coord(x,y);
    score = 0;
    lines = 0;
    for (int i = 0; i < altura; ++i) {
      for (int j = 0; j < anchura; ++j) cells[i][j] = new Cell(j,i);
    }
    current_piece = generatePiece();
    next_piece = generatePiece();
  }
  
  private Piece generatePiece() {
    Coord o = new Coord(anchura/2,4);
    Piece p;
    int randomNum = floor(random(0,7));
    switch (randomNum) {
      case 0:
        p = new PieceL(o);
        break;
      case 1:
        p = new PieceJ(o);
        break;
      case 2:
        p = new PieceO(o);
        break;
      case 3:
        p = new PieceS(o);
        break;
      case 4:
        p = new PieceZ(o);
        break;
      case 5:
        p = new PieceT(o);
        break;
      case 6:
        p = new PieceI(o);
        break;
      default:
        throw new java.lang.IllegalArgumentException();
    }
    return p;
  }
  
  public void genNextPiece() {
    current_piece = next_piece;
    next_piece = generatePiece();
  }
  
  /*Given a cell (x,y), check if it is occupied*/
  public boolean isOccupied(int x, int y) {
    if (x < 0 || x >= anchura) throw new java.lang.IllegalArgumentException();
    else if (y < 0 || y >= altura) throw new java.lang.IllegalArgumentException();
    return cells[x][y].isOccupied();
  }
  
  public void move(String direction) {
    if (direction == "UP") current_piece.rotatePiece();
    current_piece.movePiece(direction, anchura, altura);
  }
  
  public boolean game() {
    Coord[] positions = current_piece.getCoords();
    int[] colors = current_piece.getColor();
    
    Coord aux;
    
    if (landed(positions)) {
      
      for (int i = 0; i < 4; ++i) {
        aux = positions[i].clone();
        if (aux.i < anchura && aux.j < altura) 
          cells[aux.i][aux.j].setOccupied(colors[0],colors[1],colors[2]);
      }
      
      int full = fullRows();
      calculateScore(full);
      
      show();
      
      for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < anchura; ++j) {
          if (cells[i][j].isOccupied()) return false;
        }
      }
      
    }
    else {
      // game 66
      
      for (int i = 0; i < 4; ++i) {
        aux = positions[i].clone();
        if (aux.j < anchura && aux.i < altura) 
          cells[aux.i][aux.j].setOccupied(colors[0],colors[1],colors[2]);
      }
      
      show();
      
      for (int i = 0; i < 4; ++i) {
        aux = positions[i].clone();
        if (aux.j < anchura && aux.i < altura) 
          cells[aux.i][aux.j].clearOccupied();
      }
    }
    
    return true;
  }
  
  private void calculateScore(int full) {
    score += full;
  }
 
  private boolean landed(Coord[] positions) {
    for (int i = 0; i < 4; ++i) {
      if (positions[i].j+1 == altura-1) return true;
      else if (cells[positions[i].i+1][positions[i].j].isOccupied()) return true;
    }
    return false;
  }
  
  private int fullRows() {
    int full = 0;
    for (int i = 4; i < altura; --i) {
      boolean occupied = true;
      for (int j = 0; j < anchura && occupied; ++j) {
        if (!cells[i][j].isOccupied()) occupied = false;
      }
      if (occupied == true) {
        ++full;
        ++lines;
        for (int j = 0; j < anchura; ++j) cells[i][j].clearOccupied();
        //Push down all the upper cells
        for (int ii = i; ii > 0; --ii) {
          for (int j = 0; j < anchura; ++j) {
            cells[ii][j].replace(cells[ii-1][j]);
          }
        }
        for (int j = 0; j < anchura; ++j) cells[0][j].clearOccupied();
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
  
  //Position of the board (relative to the viewport)
  private Coord position;
  //altura of the board
  private static final int anchura = 10;
  //Length of the board, the first 4 rows are reserved.
  private static final int altura = 20+4;
  //Matrix of the cells of the board
  private Cell[][] cells;
  //Points obtained in the board
  private int score;
  //Lines cleared in the board
  private int lines;
  //Piece currently in use
  private Piece current_piece;
  //Next piece in the game
  private Piece next_piece;
}
