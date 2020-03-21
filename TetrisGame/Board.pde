class Board {
  public Board(int x, int y) {
    position = new Coord(x,y);
    score = 0;
    lines = 0;
    for (int i = 0; i < length; ++i) {
      //Create cells
      /*for (int j = 0; j < width; ++j) cells[i][j] = new Cell(i,j);*/
    }
    //Generate first pieces
    /*current_piece = new Piece();
    next_piece = new Piece();*/
  }
  
  public void genNextPiece() {
    current_piece = next_piece;
    //Generate new next piece
    /*next_piece = new Piece();*/
  }
  
  public void show() {
    for (int i = 0; i < length)
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
