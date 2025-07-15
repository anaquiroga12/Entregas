// historia: The Amazing Spider-Man Interactivo

import processing.sound.*;

// Estado
int estado = 1;

// Imágenes
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15;

// Audio
SoundFile promesa;

// Clases
EscenaConTexto escenaTexto;

void setup() {
  size(1000, 1000);

  img1 = loadImage("imagen 1.png");
  img2 = loadImage("imagen 2.png");
  img3 = loadImage("imagen 3.png");
  img4 = loadImage("imagen 4.png");
  img5 = loadImage("imagen 5.png");
  img6 = loadImage("imagen 6.png");
  img7 = loadImage("imagen 7.png");
  img8 = loadImage("imagen 8.png");
  img9 = loadImage("imagen 9.png");
  img10 = loadImage("imagen 10.png");
  img11 = loadImage("imagen 11.png");
  img12 = loadImage("imagen 12.png");
  img13 = loadImage("imagen 13.png");
  img14 = loadImage("imagen 14.png");
  img15 = loadImage("imagen 15.png");

  promesa = new SoundFile(this, "promesa.mp3");

  escenaTexto = new EscenaConTexto();
}

void draw() {
  background(255);

  switch (estado) {
  case 1:
    image(img1, 0, 0, width, height);
    escenaTexto.mostrarTexto("Oprima tecla 'l' para abrir el maletín");
    break;
  case 2:
    image(img2, 0, 0, width, height);
    escenaTexto.mostrarTexto("Oprima tecla 'o' para infiltrarnos en Oscorp");
    break;
  case 3:
    image(img3, 0, 0, width, height);
    escenaTexto.mostrarTexto("Oprima tecla ENTER para entrar al laboratorio");
    break;
  case 4:
    image(img4, 0, 0, width, height);
    escenaTexto.mostrarTexto("Clic en Gwen para dejar de imaginar una vida con Gwen y volver al laboratorio");
    break;
  case 5:
    image(img5, 0, 0, width, height);
    escenaTexto.mostrarTexto("A Peter lo picó una araña radioactiva, oprima la tecla Shift");
    break;
  case 6:
    image(img6, 0, 0, width, height);
    escenaTexto.mostrarTexto("Oprima tecla M para ver tabla de nuevas habilidades");
    break;
  case 7:
    image(img7, 0, 0, width, height);
    escenaTexto.mostrarTexto("Ya conoces tus habilidades oprime la tecla 'b' para continuar");
    break;
  case 8:
    image(img8, 0, 0, width, height);
    escenaTexto.mostrarTexto("Un gran poder conlleva una gran responsabilidad, haga clic para aceptar");
    break;
  case 9:
    image(img9, 0, 0, width, height);
    escenaTexto.mostrarTexto("Oprima tecla 's' para poner traje");
    break;
  case 10:
    image(img10, 0, 0, width, height);
    escenaTexto.mostrarTexto("Para espiar Dr Connors, oprima la tecla E");
    break;
  case 11:
    image(img11, 0, 0, width, height);
    escenaTexto.mostrarTexto("Para pelear con el lagarto oprima P");
    break;
  case 12:
    image(img12, 0, 0, width, height);
    escenaTexto.mostrarTexto("Para ganar la pelea y ver al padre de Gwen oprima la tecla M");
    break;
  case 13:
    image(img13, 0, 0, width, height);
    escenaTexto.mostrarTexto("Para hablar con Gwen oprima la tecla F");
    break;
  case 14:
    image(img14, 0, 0, width, height);
    escenaTexto.mostrarTexto("Para escuchar lo que le dijo el capitán a Peter oprima la tecla espacio");
    break;
  case 15:
    image(img15, 0, 0, width, height);
    escenaTexto.mostrarTexto("Peter no cumplió su promesa y se culpa por llevar a Gwen a la muerte.");
    if (!promesa.isPlaying()) {
      promesa.play();
    }
    break;
  }
}

void keyPressed() {
  if (estado == 1 && key == 'l') estado = 2;
  else if (estado == 2 && key == 'o') estado = 3;
  else if (estado == 3 && keyCode == ENTER) estado = 5;
  else if (estado == 5 && keyCode == SHIFT) estado = 6;
  else if (estado == 6 && key == 'm') estado = 7;
  else if (estado == 7 && key == 'b') estado = 8;
  else if (estado == 9 && key == 's') estado = 10;
  else if (estado == 10 && key == 'e') estado = 11;
  else if (estado == 11 && key == 'p') estado = 12;
  else if (estado == 12 && key == 'm') estado = 13;
  else if (estado == 13 && key == 'f') estado = 14;
  else if (estado == 14 && key == ' ') estado = 15;
}

void mousePressed() {
  if (estado == 3 && mouseX < width/2) estado = 4;
  else if (estado == 4) estado = 3;
  else if (estado == 8) estado = 9;
}

// CLASE PADRE
class EscenaBase {
  void mostrarTextoBase(String t) {
    fill(255);
    stroke(0);
    rect(20, 20, width-40, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(t, width/2, 50);
  }
}

// clase hija
class EscenaConTexto extends EscenaBase {
  void mostrarTexto(String t) {
    fill(255);
    stroke(0);
    rect(20, 20, width-40, 60);
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(t, width/2, 50);
  }
}
