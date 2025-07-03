// Importar la libreria Sound
import processing.sound.*;
import processing.sound.FFT;

SoundFile soundfile;
FFT fft;

int bands = 256;
float[] spectrum = new float[bands];

ArrayList<Fragmento> fragmentos;

//    tamano pulso
float rPulso = 0;
//    opacidad
float alphaPulso = 0;

void setup() {
  size(1000, 1000);
  background(0);
  noStroke();

  // cancion elegida
  soundfile = new SoundFile(this, "i love you.mp3");
  fft = new FFT(this, bands);
  fft.input(soundfile);
  soundfile.play();

  // particulas que van a flotar
  fragmentos = new ArrayList<Fragmento>();
}

void draw() {
  fft.analyze(spectrum);

  // Fondo azul profundo
  fill(2, 6, 20, 40);
  rect(0, 0, width, height);

  // -------- PULSO DE LA VOZ PICUDO --------
  float voz = spectrum[10] * 1200;
  float centroX = width / 2;
  float centroY = height / 2;

  if (voz > 10) {
    rPulso = voz;
    alphaPulso = 150;
  }

  if (alphaPulso > 0) {
    for (int i = 0; i < 60; i++) {
      float angulo = random(TWO_PI);
      float radio = rPulso / 2 + random(-20, 30); // forma irregular
      float x = centroX + cos(angulo) * radio;
      float y = centroY + sin(angulo) * radio;

      float tam = random(5, 12);
      fill(100, 180, 255, alphaPulso);
      ellipse(x, y, tam, tam * 1.4); // forma más punzante
    }

    rPulso += 2.5;
    alphaPulso -= 2.8;
  }

  //fragmentos que flotan
  // cada 3 fotogramas se crea uno nuevo
  if (frameCount % 3 == 0) {
    fragmentos.add(new Fragmento());
  }

  for (int i = fragmentos.size() - 1; i >= 0; i--) {
    Fragmento f = fragmentos.get(i);
    // mueve la particula y reduce visibilidad
    f.update();
    // dibuja la particula
    f.display();
    //   (opacidad)
    if (f.alpha <= 0) {
      fragmentos.remove(i);
    }
  }
}

// particulas
class Fragmento {
  float x, y;  // posicion actual
  float dx, dy; //velocidad de hacia donde se mueve
  float r; // tamano
  float alpha; // opacidad
  color col; //color de la particula

  Fragmento() {
    x = random(width);
    y = random(height);
    dx = random(-0.3, 0.3);
    dy = random(-0.1, -0.6);
    r = random(1.5, 3.5);
    alpha = random(30, 80);
    col = color(random(100, 160), random(140, 200), 255);
  }

  // mueve la particula y reduce la visibilidad
  void update() {
    x += dx;
    y += dy;
    alpha -= 0.3;
  }

  // dibuja la particula con su color y transparencia actual
  void display() {
    fill(col, alpha);
    ellipse(x, y, r, r);
  }
}
