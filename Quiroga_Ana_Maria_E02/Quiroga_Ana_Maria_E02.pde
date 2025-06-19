//tamano de incrementos
int incrementos = 30;

//tamano canva y bloque de codigo que solo se escribe una vez
void setup() {
  size(1000, 1000);
  background(255);
}

//
void draw() {
  for (int y = 0; y <= height; y += incrementos) {
    for (int x = 0; x <= width; x += incrementos) {
     
 //figuras

 // Fondo de cada celda
      noStroke();
      fill(random(150, 255), random(100, 255), random(100, 255));
      rect(x, y, incrementos, incrementos);  // Fondo de cada celda

// Triángulo abajo
        fill(random(100, 255), random(100, 255), random(100, 255));
      triangle(x, y, x + incrementos, y, x + incrementos/2, y + incrementos);  

// Círculo del centro
      fill(random(100, 255), random(100, 255), random(100, 255));
      ellipse(x + incrementos/2, y + incrementos/2, incrementos/2, incrementos/2);  
    
    }
  }
}
