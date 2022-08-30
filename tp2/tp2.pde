import fisica.*;
FWorld world;
FBox pala;
Caramelos caramelos;
int puntos=0;
void setup() {

  size(1620, 950);

  Fisica.init(this);
  world= new FWorld();
  //  world.setEdges();
  Plataforma piso = new Plataforma(width, 10);

  piso.inicializar(width/2, 960);
  world.add(piso);

  pala = new FBox(120, 120);
  pala.setPosition(width/2, height - 40);
  pala.setStatic(true);
  pala.setFill(0);
  pala.setRestitution(0);
  world.add(pala);

  //caramelos.inicializar();
}

void draw() {

  background(255);
  textSize(20);
  fill(0);
  text("Puntos:"+puntos, 300, 200);
  caramelos = new Caramelos(40);
  if (frameCount % 50 == 0) {
    caramelos.dibujar(random(width/2-300, width/2+300), 50);
    world.add(caramelos);
  }
  pala.setPosition(mouseX, height - 50);
  world.step();
  world.draw();
}


void contactStarted(FContact c) {
  FBody ball = null;
  if (c.getBody1() == pala) {
    ball = c.getBody2();
  } else if (c.getBody2() == pala) {
    ball = c.getBody1();
  }

  if (ball == null) {
    puntos-=10;
    return;
  }

  ball.setFill(30, 190, 200);
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
