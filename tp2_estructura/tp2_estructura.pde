import fisica.*;
import ddf.minim.*;

Minim minim;
AudioPlayer musicaFondo;
AudioSample sonidoCaramelera;
AudioSample sumarPuntos;
AudioSample sonidoPiso;
FWorld mundo;
Bloque piso, bolsa;


FCircle circulo;
Circulo caramelo;

BloqueF bF;
BloqueM bM;

BloqueM [] blM;
BloqueF [] blF;

Pendulo p1, p2, p3;

PImage caramelera;
int tamBloques, puntos, contador;
String estado;
PGraphics pantallaJuego;

void setup() {
  size(1650, 1000);

  minim= new Minim(this);
  sumarPuntos = minim.loadSample( "BD.mp3", 512);
  sonidoCaramelera= minim.loadSample("SD.wav", 512);
  sonidoPiso = minim.loadSample( "BD.mp3", 512);
  
  musicaFondo= minim.loadFile("musica_fondo.mp3", 2048); //inicializar objeto
  musicaFondo.loop();

  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setEdgesRestitution(1);
  estado = "Inicio";

  caramelera = loadImage("caramelera.png");
  pantallaJuego = createGraphics(width, height);


  piso = new Bloque(width-20, 5);
  piso.inicializar(width/2, height-5);
  piso.setFillColor(color(255, 0, 0));
  piso.setStatic(true);

  piso.setGrabbable(false);
  mundo.add(piso);

  pantallaJuego.beginDraw();
  p1 = new Pendulo(20, 70, 90);
  p1.inicializarPendulos(width/2-10, 250);
  p2 = new Pendulo(20, 70, 125);
  p2.inicializarPendulos(1325, 500);
  p3 = new Pendulo(20, 70, 125);
  p3.inicializarPendulos(300, 450);
  pantallaJuego.endDraw();

  bolsa = new Bloque(100, 80);
  bolsa.inicializarBolsa(width/2, height-80);
  mundo.add(bolsa);

  inicializarBloquesMovibles();
  inicializarBloquesFijos();

  puntos = 0;
  contador = 60;

  estado = "inicio";
}

void draw() {
  background(#FFFEF2);

  // --- "INICIO"
  if (estado.equals("inicio")) {
    background(0);
    pushStyle();
    textAlign(CENTER);
    textSize(40);
    text("INICIO", width/2, height/2-200);
    popStyle();

    FCircle circulo = new FCircle(20);
    circulo.setPosition(width/2, height/2);
    // mundo.add(circulo);
  } else if (estado.equals("jugando")) {
    contador++;

    if (contador > 600) {
      bolsa.moverBolsa();
      p1.moverPendulos(250);
      p2.moverPendulos(300);
      p3.moverPendulos(200);

      if (contador == 650) {
        agregarCaramelos();
      }

      if (contador > 700) {
        contador = 60;
      }
    }
  }

  image(caramelera, width/2-190, 5);
  mundo.step();
  mundo.draw();
}

void inicializarBloquesFijos() {
  blF = new BloqueF [40];
  tamBloques = 50;

  // --- > Mitad derecha
  blF[0] = new BloqueF(tamBloques);
  blF[0].inicializarBloquesFijos(1050, 450, 1, 0);
  blF[1] = new BloqueF(tamBloques);
  blF[1].inicializarBloquesFijos(1100, 450, 1, 0);
  blF[2] = new BloqueF(tamBloques);
  blF[2].inicializarBloquesFijos(1250, 400, 1, 0);
  blF[3] = new BloqueF(tamBloques);
  blF[3].inicializarBloquesFijos(1300, 400, 1, 0);
  blF[4] = new BloqueF(tamBloques);
  blF[4].inicializarBloquesFijos(1350, 300, 1, 0);
  blF[5] = new BloqueF(tamBloques);
  blF[5].inicializarBloquesFijos(1350, 500, 1, 45);
  blF[6] = new BloqueF(tamBloques);
  blF[6].inicializarBloquesFijos(1400, 400, 1, 0);
  blF[7] = new BloqueF(tamBloques);
  blF[7].inicializarBloquesFijos(1450, 400, 1, 0);
  blF[8] = new BloqueF(tamBloques);
  blF[8].inicializarBloquesFijos(1150, 700, 1, 0);
  blF[9] = new BloqueF(tamBloques);
  blF[9].inicializarBloquesFijos(1200, 700, 1, 0);
  blF[10] = new BloqueF(tamBloques);
  blF[10].inicializarBloquesFijos(1100, 575, 1, 45);
  blF[11] = new BloqueF(tamBloques);
  blF[11].inicializarBloquesFijos(1400, 800, 1, 0);
  blF[12] = new BloqueF(tamBloques);
  blF[12].inicializarBloquesDiagonales(1500, 800, -50);
  blF[13] = new BloqueF(tamBloques);
  blF[13].inicializarBloquesDiagonales(1500, 200, 50);
  blF[14] = new BloqueF(tamBloques);
  blF[14].inicializarBloquesDiagonales(1565, 500, 90);
  blF[15] = new BloqueF(tamBloques);
  blF[15].inicializarBloquesFijos(1050, 750, 1, 0);
  blF[16] = new BloqueF(tamBloques);
  blF[16].inicializarBloquesFijos(1050, 800, 1, 0);
  blF[17] = new BloqueF(tamBloques);
  blF[17].inicializarBloquesFijos(1000, 800, 1, 0);

  // --- Centro
  blF[18] = new BloqueF(tamBloques);
  blF[18].inicializarBloquesFijos(width/2, 500, 1, 0);
  blF[19] = new BloqueF(tamBloques);
  blF[19].inicializarBloquesFijos(850, 650, 1, 0);
  blF[20] = new BloqueF(tamBloques);
  blF[20].inicializarBloquesFijos(800, 650, 1, 0);

  // --- Mitad izquierda
  blF[21] = new BloqueF(tamBloques);
  blF[21].inicializarBloquesFijos(600, 400, 0, 0);
  blF[22] = new BloqueF(tamBloques);
  blF[22].inicializarBloquesFijos(500, 500, 0, 0);
  blF[23] = new BloqueF(tamBloques);
  blF[23].inicializarBloquesFijos(650, 550, 0, 0);
  blF[24] = new BloqueF(tamBloques);
  blF[24].inicializarBloquesFijos(650, 700, 0, 0);
  blF[25] = new BloqueF(tamBloques);
  blF[25].inicializarBloquesFijos(325, 450, 0, 45);
  blF[26] = new BloqueF(tamBloques);
  blF[26].inicializarBloquesFijos(425, 685, 0, 45);
  blF[27] = new BloqueF(tamBloques);
  blF[27].inicializarBloquesFijos(550, 650, 0, 0);
  blF[28] = new BloqueF(tamBloques);
  blF[28].inicializarBloquesFijos(250, 750, 0, 0);
  blF[29] = new BloqueF(tamBloques);
  blF[29].inicializarBloquesFijos(450, 300, 0, 0);
  blF[30] = new BloqueF(tamBloques);
  blF[30].inicializarBloquesFijos(500, 300, 0, 0);
  //blF[31] = new BloqueF(tamBloques);
  //blF[31].inicializarBloquesFijos(500, 400, 0, 0);
  blF[32] = new BloqueF(tamBloques);
  blF[32].inicializarBloquesDiagonales(150, 800, 50);
  blF[33] = new BloqueF(tamBloques);
  blF[33].inicializarBloquesDiagonales(150, 200, -50);
  blF[34] = new BloqueF(tamBloques);
  blF[34].inicializarBloquesDiagonales(85, 500, 90);
  blF[35] = new BloqueF(tamBloques);
  blF[35].inicializarBloquesFijos(600, 450, 0, 0);
  blF[36] = new BloqueF(tamBloques);
  blF[36].inicializarBloquesFijos(650, 450, 0, 0);
}
void inicializarBloquesMovibles() {
  blM = new BloqueM [40];

  blM[0] = new BloqueM();
  blM[0].inicializarBloquesMovibles(1000, 450, 1);
  blM[1] = new BloqueM();
  blM[1].inicializarBloquesMovibles(1200, 500, 1);
  blM[2] = new BloqueM();
  blM[2].inicializarBloquesMovibles(1350, 800, 1);
  blM[3] = new BloqueM();
  blM[3].inicializarBloquesMovibles(950, 600, 1);
  blM[4] = new BloqueM();
  blM[4].inicializarBloquesMovibles(950, 800, 1);
  blM[5] = new BloqueM();
  blM[5].inicializarBloquesMovibles(700, 550, 1);
  blM[6] = new BloqueM();
  blM[6].inicializarBloquesMovibles(500, 400, 1);
  blM[7] = new BloqueM();
  blM[7].inicializarBloquesMovibles(700, 750, 1);
  blM[8] = new BloqueM();
  blM[8].inicializarBloquesMovibles(300, 750, 1);
  blM[9] = new BloqueM();
  blM[9].inicializarBloquesMovibles(500, 750, 1);
  blM[10] = new BloqueM();
  blM[10].inicializarBloquesMovibles(width/2, 850, 1);
}

void keyPressed() {
  estado = "jugando";
}

void mouseClicked() {
  estado = "inicio";
}

void pantallaInicial() {
}
void grilla() {
  // FILAS Y COLUMNAS
  pushStyle();
  stroke(180);
  // ---- > filas
  line(0, 0, width, 0);
  line(0, 50, width, 50);
  line(0, 100, width, 100);
  line(0, 150, width, 150);
  line(0, 200, width, 200);
  line(0, 250, width, 250);
  line(0, 300, width, 300);
  line(0, 350, width, 350);
  line(0, 400, width, 400);
  line(0, 450, width, 450);
  line(0, 500, width, 500);
  line(0, 550, width, 550);
  line(0, 600, width, 600);
  line(0, 650, width, 650);
  line(0, 700, width, 700);
  line(0, 750, width, 750);
  line(0, 800, width, 800);
  line(0, 850, width, 850);
  line(0, 900, width, 900);
  line(0, 950, width, 950);

  // ---- > columnas

  line(50, 0, 50, height);
  line(100, 0, 100, height);
  line(150, 0, 150, height);
  line(200, 0, 200, height);
  line(250, 0, 250, height);
  line(300, 0, 300, height);
  line(350, 0, 350, height);
  line(400, 0, 400, height);
  line(450, 0, 450, height);
  line(500, 0, 500, height);
  line(550, 0, 550, height);
  line(600, 0, 600, height);
  line(650, 0, 650, height);
  line(700, 0, 700, height);
  line(750, 0, 750, height);
  line(800, 0, 800, height);
  line(850, 0, 850, height);
  line(900, 0, 900, height);
  line(950, 0, 950, height);
  line(1000, 0, 1000, height);
  line(1050, 0, 1050, height);
  line(1100, 0, 1100, height);
  line(1150, 0, 1150, height);
  line(1200, 0, 1200, height);
  line(1250, 0, 1250, height);
  line(1300, 0, 1300, height);
  line(1350, 0, 1350, height);
  line(1400, 0, 1400, height);
  line(1450, 0, 1450, height);
  line(1500, 0, 1500, height);
  line(1550, 0, 1550, height);
  line(1600, 0, 1600, height);
  popStyle();
}
