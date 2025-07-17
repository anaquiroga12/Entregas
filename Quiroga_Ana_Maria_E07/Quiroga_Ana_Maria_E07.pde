String[] rows;
float[] episodes;
float[] scores;

void setup() {
  size(1000, 1000);
  background(0);

  rows = loadStrings("anime 2.csv");

  println("Filas: " + rows.length);

  int nSamples = rows.length - 1;
  episodes = new float[nSamples];
  scores = new float[nSamples];

  for (int i = 1; i < rows.length; i++) {
    String line = rows[i];
    
    // Divide en partes desde el final
    String[] cols = split(line, ',');

    
    if (cols.length < 30) {
      episodes[i - 1] = -1;
      scores[i - 1] = -1;
      continue;
    }

    String ep = trim(cols[21]);  
    String sc = trim(cols[26]);  

    if (ep.equals("") || ep.equals("Unknown")) {
      episodes[i - 1] = -1;
    } else {
      episodes[i - 1] = float(ep);
    }

    if (sc.equals("") || sc.equals("Unknown")) {
      scores[i - 1] = -1;
    } else {
      scores[i - 1] = float(sc);
    }
  }
}

void draw() {
  background(0);

  float maxEp = 0;
  float maxScore = 0;

  for (int i = 0; i < episodes.length; i++) {
    if (episodes[i] > 0 && episodes[i] > maxEp) {
      maxEp = episodes[i];
    }
    if (scores[i] > 0 && scores[i] > maxScore) {
      maxScore = scores[i];
    }
  }

  for (int i = 0; i < episodes.length; i++) {
    if (episodes[i] > 0 && scores[i] > 0) {
      float x = map(episodes[i], 0, maxEp, 50, width - 50);
      float y = map(scores[i], 0, maxScore, height - 50, 50);

      fill(0, 255, 255, 180);
      noStroke();
      ellipse(x, y, 10, 10);
    }
  }
}
