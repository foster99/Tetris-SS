// Variables globales
Board B;
Cell C;
Coord aux;
// Funcion que se ejecuta al inicio una sola vez
void setup() {
  size(600,600);
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
  // Crida a fer coses
  //B.game();
  background(color(255, 255, 255));
  C.show(aux);
  aux.x += 1;
  aux.y += 1;
}

// Funcion que se ejecuta cuando se presiona una tecla
void keyPressed() {
  switch(keyCode){
    case UP:
      background(color(255, 0, 0));
      break;
    case RIGHT:
      background(color(0, 255, 0));
      break;
    case LEFT:
      background(color(0, 0, 255));
      break;
    case DOWN:
      background(color(255, 0, 255));
      break;
    default: 
      return;
  }
}
