// Variables globales

// Funcion que se ejecuta al inicio una sola vez
void setup() {
  
  size(600,600);
  background(color(500, 100, 100));
 /* 
  int margin = 10;
  fill(color(200, 200, 255));
  rect(margin,margin, width - 2*margin, height - 2*margin);
  line(margin,margin,500,500);
  */
  
  Cell c= new Cell(450,450);
  c.setColor(0,0,255);
  c.show();
  
}


// Funcion en bucle para pintar
void draw() {
  /* for all tablero -> tablero.show
    
  */
}

// Funcion que se ejecuta cuando se presiona una tecla
void keyPressed() {
  
}
