

// hora,minuto,segundo,dia del mes, mes, ano
int  h, m, s, d, mo, y;

void setup() {
  size(800, 800);
  frameRate(30);
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  h = hour();
  m = minute();
  s = second();
  d = day();
  mo = month();
  y = year();

  //fondo segun ano
  float tonoFondo = map(y, 2020, 2030, 210, 240); // azul medio oscuro
  background(tonoFondo, 20, 25); //(20,25 + 2025)


  // Mostrar las horas como rectangulos en la parte de arriba
  for (int i = 0; i < h; i++) {
    float x = map(i, 0, 23, 50, width - 50);
    fill(215, 30, 60);  // color azul oscuro
    rect(x, 100, 16, 50, 5);
  }

  // "the digital calendar has become the architecture of the modern day"
  //Aqui cada rectangulo es como un bloque de la jornada, como en una agenda digital,
  //pero en vez de texto, uno ve espacios visuales

  //mostrar minutos como circulos al rededor del centro
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < m; i++) {
    float angle = TWO_PI * i / 60;
    float radius = 200;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    fill(205, 30, 80); // color azul cielo
    ellipse(x, y, 10, 10);
  }
  popMatrix();

  // "The representation of becomes less about presence and more about coordination"
  // Este circulo que se forma toma la idea del ritno, como si el dia estuviera
  //organizado para fluir entre tareas diarias, no solo para registrar momentos.

  //mostrar los segundos como triangulos girando
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < s; i++) {
    float angle = TWO_PI * i / 60;
    float radius = 100;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;

    fill(200, 20, 95); //color azul muy claro

    pushMatrix();
    translate(x, y);
    rotate(angle);
    triangle(-4, 5, 4, 5, 0, -7);
    popMatrix();
  }
  popMatrix();

  //"punctuality becomes less about meaning and more about precision"
  // Los segundos no se leen como cifras sino como pulsos visuales, sabemos que pasan
  //pero no es necesario contarlos ni cuantificarlos


  // mostrar dia del mes como puntos pequenos en la parte de abajo
  for (int i = 0; i < d; i++) {
    float x = map(i, 0, 30, 50, width - 50);
    fill(215, 20, 70); // color azul palido
    ellipse(x, height - 40, 8, 8);
  }

  // "We don't just live in time, we live by time"
  // Esto muestra como el dia se acumula como un tipo de seguimiento visual, no dicen
  //que dia es pero si muestran cuanto tiempo ha pasado


  // mostrar mes como puntos grandes en un circulo
  pushMatrix();
  translate(width/2, height/2);
  float radioMes = 300;
  for (int i = 0; i < mo; i++) {
    float angle = TWO_PI * i / 12;
    float x = cos(angle) * radioMes;
    float y = sin(angle) * radioMes;
    fill(220, 50, 40); // color azul profundo
    ellipse(x, y, 18, 18);
  }
  popMatrix();
}

// "The calendar is a disciplining device... it shapes behavior through visualization"
// Estos circulos sono como un ciclo, muestran que tan lejos esta uno sin necesidad
//de decir el mes como tal

//Este diseno muestra el tiempo en una forma visual creativa , no como una maquina, 
//sino como un paisaje, "time is now segmented, functionalized and monitored
//algorithmically"
