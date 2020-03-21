class Board {
  
  Board(int x, int y) {
    position = new Coord(x,y);
    score = 0;
    lines = 0;
    for (int i = 0; i < length; ++i) {
      for (int j = 0; j < width; ++j) 
    }
  }
  
  void genNextPiece() {
  }
  
  void show() {
    
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
