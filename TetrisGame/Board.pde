class Board {
  
  Board() {
    score = 0;
    lines = 0;
    
  }
  
  void show() {
    
  }
  //Position of the board (relative to the viewport)
  private float[] position;
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
