import java.util.*; 

class Board {
  public Board(int x, int y) {
    position = new Coord(x,y);
    score = 0;
    lines = 0;
    highestOccupied = altura-1;
    for (int i = 0; i < altura; ++i) {
      for (int j = 0; j < anchura; ++j) cells[i][j] = new Cell(i,j);
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
        p = new PieceO(o);
        break;
      case 2:
        p = new PieceT(o);
        break;
      case 3:
        p = new PieceL(o);
        break;
      case 4:
        p = new PieceL(o);
        break;
      case 5:
        p = new PieceL(o);
        break;
      case 6:
        p = new PieceL(o);
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
    current_piece.movePiece(direction);
  }
  
  public void game() {
    /*Obtain current piece position array 4 positions
      Check if current piece lands on an occupied cell
      If true 
        updateHighestOccupied if necessary
        occupieCells
        If line completed
          Calculate score, update lines cleared and clear lines
        If 4 first rows are occupied:
          gameOver();
        show()
      else 
        occupieCells
        show()
        unoccupieCells
    */
    Coord[] positions = current_piece.getCoords();
    int[] colors = current_piece.getColor();
    if (landed(positions)) {
      for (int i = 0; i < 4; ++i) cells[positions[i].x][positions[i].y].setOccupied(colors[0],colors[1],colors[2]);
      int full = fullRows();
      calculateScore(full);
    }
    else {
      for (int i = 0; i < 4; ++i) cells[positions[i].x][positions[i].y].setOccupied(colors[0],colors[1],colors[2]);
      for (int i = 0; i < 4; ++i) cells[positions[i].x][positions[i].y].clearOccupied();
    }
    
  }
  
  private calculateScore(int full)
 
  private boolean landed(Coord[] positions) {
    for (int i = 0; i < 4; ++i) {
      if (positions[i].y-1 == altura-1) return true;
      else if (cells[positions[i].x][positions[i].y-1].isOccupied()) return true;
    }
    return false;
  }
  
  private int fullRows() {
    int full = 0;
    for (int i = highestOccupied; i >= 0; --i) {
      boolean occupied = true;
      for (int j = 0; j < anchura && occupied; ++j) {
        if (!cells[i][j].isOccupied()) occupied = false;
      }
      if (occupied == true) {
        ++full;
        ++lines;
        for (int j = 0; j < anchura; ++j) cells[i][j].clearOccupied();
        //Push down all the upper cells
        for (int ii = i; ii > highestOccupied; --ii) {
          for (int j = 0; j < anchura; ++j) {
            //cells[ii][j].replace(cells[ii-1][j]);
            //cells[ii][j] = cells[ii+1][j];
            //cell copy
          }
        }
        for (int j = 0; j < anchura; ++j) cells[highestOccupied][j].clearOccupied();
      }
    }
    return full;
  }
  
  private void show() {
    for (int i = 0; i < altura; ++i) {
       for (int j = 0; j < altura; ++j) {
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
  //Matrix of the cells of the board
  private Cell[][] cells = new Cell[altura][anchura];
  //altura of the board
  private static final int anchura = 10;
  //Length of the board, the first 4 rows are reserved.
  private static final int altura = 20+4; 
  //Points obtained in the board
  private int score;
  //Lines cleared in the board
  private int lines;
  //Piece currently in use
  private Piece current_piece;
  //Next piece in the game
  private Piece next_piece;
  private int highestOccupied;
}
