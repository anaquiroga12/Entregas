// crear canva
background (255,255,255);
size (500,500);

//crear camara

//rectangulo grande (forma camara)
fill (81,81,81);
rect (36,120,219,305,8);
 
 // rectangulo pequeno (donde se ve)
fill(6,7,7);
rect (50,160,24,37);

// recangulo mediano (flash)
fill (207,206,206);
rect(92,138,34,83);

//circulos pequenos (boton para fotos)
//circulo grande
fill(73,73,71);
ellipse (63,246,36,36);
//circulo pequeno
fill (207,206,206);
ellipse (63,246,28,26);

// circulos grandes (lentes camara)
// circulo grande
fill (139,139,140);
ellipse (165,312,128,125);
// circulo mediano
fill (66,66,63);
ellipse (165,313,90,88);
// circulo pequeno
fill (40,40,40);
ellipse (163,313,40,39);

//rectangulo en circulos (espejo de camara)
fill (207,206,206);
rect (126,302,14,23);

// linea de division
fill(194,193,193);
line (85,120,85,424);

//linea camara
line (150,297,175,327);

//fotos
//foto saliendo de la camara
fill(255,255,255);
rect (100,10,127,117);
fill(20,40,70);
rect (118,29,89,98);

//foto externa 
fill (255,255,255);
rect (329,177,128,188);
fill (152,215,229);
rect (344,190,97,126);

//circulo (cielo)
fill (234,181,47);
ellipse (397,224,41,40);
fill (196,225,232);
ellipse (420,230,33,9);

ellipse (380,220,33,9);

//triangulo (montanas)
fill (64,124,64);
triangle (390,316,440,316,420,280);
triangle (380,316,420,316,400,280);
triangle (345,316,380,316,370,280);
