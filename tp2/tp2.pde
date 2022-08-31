import fisica.*;
FWorld world;
FBox bolsa;
Caramelos caramelo1;
Caramelos caramelo2;
Caramelos caramelo3;
int puntos=0;
PImage bolsaImg;
PImage caramelera;
void setup() {

  size(1650, 900);
  caramelera=loadImage("caramelera.png");
  Fisica.init(this);
  world= new FWorld();
  world.setEdges();
  Plataforma piso = new Plataforma(width, 10);

  piso.inicializar(width/2, height);
  world.add(piso);

  bolsa = new FBox(120, 120);
  bolsa.setPosition(width/2, height - 40);
  bolsa.setStatic(true);
  // pala.setFill(0);
  bolsaImg= loadImage("bolsa.png");
  bolsa.attachImage(bolsaImg);
  bolsa.setName("bolsa");
  bolsa.setRestitution(0);
  world.add(bolsa);
}

void draw() {

  background(255);
  image(caramelera, width/2-150, 0);
  textSize(20);
  fill(0);
  text("Puntos:"+puntos, 300, 200);
  caramelo1 = new Caramelos(40);
  caramelo2 = new Caramelos(40);
  caramelo3 = new Caramelos(40);
  if (frameCount % 20 == 0) {
    caramelo1.dibujar(random(width/2-50, width/2+120), 150);
    world.add(caramelo1);
  } else if (frameCount % 50 == 0) {
    caramelo2.dibujar(random(width/2-50, width/2+120), 150);
    world.add(caramelo2);
  } else if (frameCount % 100 == 0) {
    caramelo3.dibujar(random(width/2-50, width/2+120), 150);
    world.add(caramelo3);
  }
  bolsa.setPosition(mouseX, height - 50);
  world.step();
  world.draw();
}


void contactStarted(FContact c) {


  FBody cuerpo1= c.getBody1();
  FBody cuerpo2= c.getBody2();

  String nombre1= conseguirNombre(cuerpo1);
  String nombre2= conseguirNombre(cuerpo2);

  //si colisiona con la bolsa
  if (nombre1 == "caramelo1" && nombre2 == "bolsa" ) {
    println("+10 PUNTOS");
    puntos+=10;
  } else if (nombre1 == "caramelo2" && nombre2 == "bolsa" ) {
    println("+20 PUNTOS");
    puntos+=20;
  } else if (nombre1 == "caramelo3" && nombre2 == "bolsa" ) {
    println("+30 PUNTOS");
    puntos+=30;
  } else if (nombre1 == "caramelo4" && nombre2 == "bolsa" ) {
    println("+40 PUNTOS");
    puntos+=40;
  }
  //si colisiona con el piso

  if (nombre1 == "plataforma" && nombre2 == "caramelo1" ) {
    puntos-=10;
    println("-10PUNTOS");
    world.remove(cuerpo2);
  } else if (nombre1 == "plataforma" && nombre2 == "caramelo2" ) {
    puntos-=10;
    println("-10PUNTOS");
    world.remove(cuerpo2);
  } else if (nombre1 == "plataforma" && nombre2 == "caramelo3" ) {
    puntos-=10;
    println("-10PUNTOS");
    world.remove(cuerpo2);
  }
  if (nombre1 == "plataforma" && nombre2 == "caramelo4" ) {
    println("-10PUNTOS");
    world.remove(cuerpo2);
  }




  FBody ball = null;
  if (c.getBody1() == bolsa) {
    ball = c.getBody2();
  } else if (c.getBody2() == bolsa) {
    ball = c.getBody1();
  }

  if (ball == null) {
    return;
  }

  world.remove(ball);


  println("ball:"+ball.getName());
  if (ball.getName() == "caramelo1") {
    println("+10 PUNTOS");
    puntos+=10;
  } else if (ball.getName() == "caramelo2") {
    println("+20 PUNTOS");
    puntos+=20;
  } else if (ball.getName() == "caramelo3") {
    println("+30 PUNTOS");
    puntos+=30;
  } else if (ball.getName() == "caramelo4") {
    println("+40 PUNTOS");
    puntos+=40;
  }
}
