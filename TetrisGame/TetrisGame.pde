// Variables globales
Board B;
Cell C;
Coord aux;
boolean gameRunning = true;
int tick = 0;
// Funcion que se ejecuta al inicio una sola vez
void setup() {
  size(400,800);
  background(color(255, 255, 255));
  
  C= new Cell(1,1);
  B= new Board(0,0);
  aux= new Coord(0,0);
  /*
  Cell c= new Cell(450,450);
  c.setColor(0,0,255);
  Coord f= new Coord(0,0);
  c.show(f);
  */
}

// Funcion en bucle para pintar
void draw() {
  ++tick;
  // Crida a fer coses
  
  
  if (gameRunning) {
    if (tick%30 == 0)
      B.current_piece.movePiece("DOWN");
    background(color(255, 255, 255));
    gameRunning = B.game();
    //C.show(aux);
    aux.x += 1;
    aux.y += 1;
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
