import java.util.*; 

class Board {
  public Board(int x, int y) {
    position = new Coord(x,y);
    score = 0;
    lines = 0;
    for (int i = 0; i < length; ++i) {
      //Create cells
      for (int j = 0; j < width; ++j) cells[i][j] = new Cell(i,j);
    }
    //Generate first pieces
    /*current_piece = genPiece();
    next_piece = genPiece();*/
  }
  
  public void genNextPiece() {
    current_piece = next_piece;
    //Generate new next piece
    /*next_piece = genPiece();*/
  }
  
  /*Given a cell (x,y), check if it is occupied*/
  public boolean isOccupied(int x, int y) {
    if (x < 0 || x >= width) throw new java.lang.IllegalArgumentException();
    else if (y < 0 || y >= length) throw new java.lang.IllegalArgumentException();
    return cells[x][y].isOccupied();
  }
  
  public void show() {
    /*Obtain current piece position
      Check if current piece lands on an occupied cell
      If true 
        occupieCells
        If line completed
          Calculate score, update lines cleared and clear lines
        If 4 first rows are occupied:
          gameOver();
      
    */
    for (int i = 0; i < length; ++i) {
       for (int j = 0; j < length; ++j) {
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
  private Cell[][] cells = new Cell[length][width];
  
  //Width of the board
  private static final int width = 10;
  
  //Length of the board, the first 4 rows are reserved.
  private static final int length = 20+4; 
  
  //Points obtained in the board
  private int score;
  
  //Lines cleared in the board
  private int lines;
  
  //Piece currently in use
  private Piece current_piece;
  
  //Next piece in the game
  private Piece next_piece;
}
