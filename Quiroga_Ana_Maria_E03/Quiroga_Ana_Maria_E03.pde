// Ana Maria Quiroga
// Circulos transmitiendo calma

int col = 10; //columnas
int fil = 10; //filas
Burbuja[][] blue;


void setup() {
  size(800, 800);
// HSB (tono, saturacion, brillo y opacidad)
  colorMode(HSB, 360, 100, 100, 255); 
  noStroke();
  
  // Burbujas
  blue = new Burbuja[col][fil];
  float espacioX = width / (float)col;
  float espacioY = height / (float)fil;

//Poner en el lugar a las burbujas
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < fil; j++) {
      float cx = i * espacioX + espacioX / 2;
      float cy = j * espacioY + espacioY / 2;
      
//tamano al azar de las burbujas      
      blue[i][j] = new Burbuja(cx, cy, random(30, 60));
    }
  }
}

void draw() {
  background(210, 20, 95); // color: Azul claro, transmite tranquilidad

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < fil; j++) {
      blue[i][j].actualizar();
      blue[i][j].mostrar();
    }
  }
}

// como se comportan las burbujas
class Burbuja {
  PVector centro; //"guardar la posicion de la burbuja"
  float tamBase; // "tamano original"
  float fase; //"numero que hace que cada burbuja titile en un tiempo"
  float rotacion; //"cuanto gira"
  float ruidoColor; //para que su color cambie de a poco"

  Burbuja(float x, float y, float tam) {
    centro = new PVector(x, y);
    tamBase = tam;
    fase = random(TWO_PI);
    rotacion = random(TWO_PI);
    ruidoColor = random(1000);
  }


//para girar la burbuja
  void actualizar() {
    rotacion += 0.002;
  }

//cuantas burbujas van pasando "frame" 
  void mostrar() {
    float t = frameCount * 0.02;

// titilacion (como respiración)
    float pulso = sin(t + fase);
    float tamActual = map(pulso, -1, 1, tamBase * 0.8, tamBase * 1.3);
    float alpha = map(pulso, -1, 1, 0, 180); // desaparece y aparece suavemente

// Colores azules
    float tono = map(noise(ruidoColor + t * 0.02), 0, 1, 180, 220);
    float sat = map(pulso, -1, 1, 20, 60);  // saturación variable
    float bri = 100;  // siempre brillante

    fill(tono, sat, bri, alpha);

// Posicionar y rotar antes de dibujar para no afectar las demas burbujas
    pushMatrix();
    translate(centro.x, centro.y);
    rotate(rotacion);

    // Dibujo círculo 
    ellipse(0, 0, tamActual, tamActual);
    popMatrix();
  }
}
