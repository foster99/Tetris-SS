
Board B;
boolean gameRunning = true;
int tick = 0;

void resetBackground() {
  background(color(255, 255, 255));
  return;
}

void setup() {
  
  size(400,800);
  resetBackground();
  B= new Board(0,0);
  
}


void draw() {
   
  if (gameRunning) {
    
    if (++tick%60 == 0)
      B.current_piece.movePiece("DOWN", Board.anchura, Board.altura);
    
    resetBackground();
    gameRunning = B.game();
  }
  
}

// Funcion que se ejecuta cuando se presiona una tecla
void keyPressed() {
  switch(keyCode){
    case UP:
      B.move("UP");
      break;
    case RIGHT:
      B.move("RIGHT");
      break;
    case LEFT:
      B.move("LEFT");
      break;
    case DOWN:
      B.move("DOWN");
      break;
    default: 
      return;
  }
}
