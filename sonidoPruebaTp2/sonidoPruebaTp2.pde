import fisica.*;
//librería de sonido
import ddf.minim.*;
Minim minim;
//sonidos largos
AudioPlayer musicaFondo;
//sonidos cortos
AudioSample sonidoBloques;
AudioSample sumarPuntos;
AudioSample sonidoFin;
AudioSample sonidoPerder;


FWorld mundo, inicio;

Plataforma piso, bolsa, chocolate, bolsainicio, logo;
Plataforma bordeIzq, bordeDer, instr;
Plataforma [] bloquesFijos;
Plataforma [] bloquesMovibles;

FCircle circulo;
Caramelo caramelo, caramelera;

Caramelo [] caramelos;
Pendulo p1, p2, p3;

PImage imgCaramelera, chocolateEnvoltorio, imgLogo;
PImage flynnpaff, choco, malva, gomita, gomita1, gomita2;
PImage [] yapa;
PImage instrucciones;
PImage fondo, bordes;

int tamBloques;
int puntos, vidas;
int contadorInstrucciones, contadorJuego, contadorCaramelos;
String estado, sub_estado;
PGraphics pantallaInstrucciones;
int valorOpacidad;

void setup() {
  size(1280, 960);

  //sonido
  minim= new Minim(this);
  sumarPuntos = minim.loadSample( "puntos.mp3", 512);
  sonidoPerder = minim.loadSample( "perder.mp3", 600);
  sonidoFin = minim.loadSample( "fin.mp3", 512);
  sonidoBloques = minim.loadSample( "rebote.mp3", 512);
  musicaFondo= minim.loadFile("musica_fondo.mp3", 2048); //inicializar objeto
  musicaFondo.loop();

  Fisica.init(this);

  // -- MUNDOS
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setEdgesRestitution(1);
  inicio = new FWorld();
  inicio.setEdges();

  // -- CARGA DE IMÁGENES
  cargaImagenes();

  // -- BORDES
  bordeIzq = new Plataforma(20, height);
  bordeIzq.attachImage(bordes);
  bordeIzq.inicializar(15, height/2);
  bordeIzq.setStatic(true);
  mundo.add(bordeIzq);
  bordeDer = new Plataforma(20, height);
  bordeDer.attachImage(bordes);
  bordeDer.inicializar(width-15, height/2);
  bordeDer.setStatic(true);
  mundo.add(bordeDer);

  caramelos = new Caramelo[4];
  tamBloques = 50;

  // -- PÉNDULOS
  p1 = new Pendulo(20, 70, 90);
  p1.inicializarPendulos(width/2, 280);
  p2 = new Pendulo(20, 70, 90);
  p2.inicializarPendulos(width/2 + (tamBloques*5), 475);
  p3 = new Pendulo(20, 70, 90);
  p3.inicializarPendulos(width/2 - (tamBloques*5), 475);


  piso = new Plataforma(width, 20);
  piso.iniciarPiso(width/2, height-15);
  mundo.add(piso);
  inicio.add(piso);

  bolsa = new Plataforma(100, 80);
  bolsa.inicializarBolsa(width/2, height-80);
  mundo.add(bolsa);

  chocolate = new Plataforma(tamBloques, tamBloques);
  chocolate.iniciarBloquesMovibles(width/2, 650, 0);
  inicio.add(chocolate);

  caramelo = new Caramelo(40);
  caramelo.dibujarCarameloInicio(width/2, 500);
  caramelo.setName("caramelo_inicio");
  inicio.add(caramelo);

  bolsainicio = new Plataforma(100, 80);
  bolsainicio.inicializarBolsa(width/2, height-200);
  inicio.add(bolsainicio);

  caramelera = new Caramelo(20);
  caramelera.iniciarCaramelera(width/2, 180);
  caramelera.attachImage(imgCaramelera);
  mundo.add(caramelera);

  inicializarBloquesMovibles();
  inicializarBloquesFijos();

  puntos = 0;
  contadorInstrucciones = 0;
  contadorCaramelos = 0;
  pantallaInstrucciones = createGraphics(width, height);
  valorOpacidad = 150;
  vidas = 5;
  estado = "inicio";
  sub_estado = "";
}

void draw() {
  println(estado);
  background(255);
  mundo.step();
  inicio.step();

  pantallaInstrucciones.beginDraw();
  pantallaInstrucciones.background(0, valorOpacidad);
  pantallaInstrucciones.endDraw();

  // --- SI EL ESTADO ES "INICIO"
  if (estado.equals("inicio")) {
    background(fondo);
    inicio.draw();
    pushStyle();
    imageMode(CENTER);
    image(imgLogo, width/2, 600);
    popStyle();
    resetear();
  } else if (estado.equals("jugando")) { // --- SI EL ESTADO ES "JUGANDO"
    // El cambio de "inicio" a "jugando" se da con el contacto del caramelo con la bolsa
    background(fondo);
    mundo.draw();
    pushStyle();
    textSize(30);
    fill(0); // -- PUNTOS Y VIDAS
    text("PUNTOS:", width/2 - tamBloques*9, 110);
    text(puntos, width/2 - tamBloques*6, 110);
    text("VIDAS:", width/2 + tamBloques*5, 110);
    text(vidas, width/2 + tamBloques*7, 110);
    popStyle();
    contadorInstrucciones++;
    image(pantallaInstrucciones, 0, 0);
    if (contadorInstrucciones > 50) {
      // Si la variable "contadorInstrucciones" supera el valor de 50, la opacidad del fondo de las instrucciones comienza a bajar
      // Y se elimina el objeto "instrucciones" del mundo
      valorOpacidad = constrain(valorOpacidad, 0, 150);
      valorOpacidad--;
      if (valorOpacidad == 0) {
        // Si la opacidad llega a 0, el sub_estado pasa a ser "JUEGO" y comienza a correr el tiempo del juego
        sub_estado = "juego";
      }
    }
    if (sub_estado.equals("juego")) {
      println(contadorCaramelos);
      contadorCaramelos++;
      p1.moverPendulos(150);
      p2.moverPendulos(200);
      p3.moverPendulos(170);
      bolsa.moverBolsa();
      if (contadorCaramelos == 100) {
        agregarCaramelos();
      }
      if (contadorCaramelos > 600) {
        contadorCaramelos = 0;
      }
    }
  } else if (estado.equals("fin_vidas")) {
    background(#FAD4D4);
    resetear();
    pushStyle();
    textAlign(CENTER);
    fill(0);
    textSize(35);
    text("OH NO! TE QUEDASTE SIN VIDAS", width/2, height/2);
    popStyle();
  } else if (estado.equals("fin_puntos")) {
    background(#FAD4D4);
    resetear();
    pushStyle();
    textAlign(CENTER);
    fill(0);
    textSize(35);
    text("OH NO! NO LOGRASTE CONSEGUIR NINGÚN CARAMELO", width/2, height/2);
    popStyle();
  }
}


void mouseClicked() {
  if (estado.equals("jugando")) {
    estado = "fin";
  } else if (estado.equals("fin")) {

    estado = "jugando";
  }
}

void cargaImagenes() {

  fondo = loadImage("fondo.jpg");
  instrucciones = loadImage("prueba.jpg");
  bordes = loadImage("bordes.png");
  imgLogo = loadImage("logo.png");

  imgCaramelera = loadImage("caramelera.png");

  flynnpaff = loadImage("flynnpaff.png");
  yapa = new PImage[5];
  for (int i = 0; i < 5; i++) {
    yapa[i] = loadImage("yapa" + nf(i, 2) + ".png");
  }
  choco = loadImage("chocolate00.png");
  malva = loadImage("malva.png");
  gomita = loadImage("gomita01.png");
  gomita1 = loadImage("gomita02.png");
  gomita2 = loadImage("gomita03.png");

  chocolateEnvoltorio = loadImage("chocolate1.png");
}
