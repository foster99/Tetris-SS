
Board B;
boolean gameRunning = true;
double tick = 0;

void resetBackground() {
  background(color(255, 255, 255));
  return;
}

void setup() {
  
  size(400,800);
  resetBackground();
  B= new Board(10,10);
  
}


void draw() {
   
  if (gameRunning) {
    
    if (++tick%20 == 0)
      B.move("DOWN");
    
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
