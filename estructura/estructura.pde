import fisica.*;

FWorld mundo;
Bloque bloque, bloque2, bloque3, bloque4, bloque5;
FCircle bola;
FBox eje;
FCircle bolaC, bolaC2;
Objetivo caja;
FDistanceJoint cadena, cadena2;

Boolean goingRight;
float originalX, originalX2;


void setup() {
  size(1620, 950);
  Fisica.init(this);

  mundo = new FWorld();
  mundo.setEdges();

  bloque = new Bloque(100, 50);
  bloque.inicializar(width/2, height/2);
  bloque.setGrabbable(false);
  // bloque.setRestitution(0.1); // El primer bloque contra el que rebota tiene prácticamente 0 rebotabilidad
  float valor1 = 30;
  float m1 = map(valor1, 0, 100, 0, 1);
  bloque.setFill(50);
  bloque.setRestitution(m1);
  bloque.setStatic(true);
  // mundo.add(bloque);

  bloque2 = new Bloque(100, 50);
  bloque2.inicializar(width/2+150, height/2 + 150);
  bloque2.setStatic(true);
  bloque2.setFill(100);
  bloque3 = new Bloque(100, 50);
  bloque3.inicializar(width/2, height/2+200);
  bloque3.setFill(200);
  float valor2 = 60;
  float m2 = map(valor2, 0, 100, 0, 1);
  bloque.setRestitution(m2);
  bloque3.setStatic(true);
  //mundo.add(bloque3);

  //mapeo valores para rebote
  float valor3 = 80;
  float m3 = map(valor3, 0, 100, 0, 1);
  bloque2.setRestitution(m3);
  //mundo.add(bloque2);

  bola = new FCircle(30);
  bola.setPosition(random(width), 0);
  bola.setDensity(0.1);
  bola.setVelocity(0, 400);
  bola.setRestitution(0.5);
  // mundo.add(bola);

  for (int i=0; i<8; i++) {
    bloque4= new Bloque(100, 50);
    bloque4.setFill(150);
    bloque4.setRestitution(m3);
    bloque4.setStatic(true);
    bloque4.setGrabbable(false);
    bloque4.adjustPosition(150+200*i, 400);
    mundo.add(bloque4);
  }

  for (int i=0; i<8; i++) {
    bloque4= new Bloque(100, 50);
    bloque4.setFill(200);
    bloque4.setRestitution(m3);
    bloque4.setGrabbable(false);
    bloque4.setStatic(true);
    bloque4.adjustPosition(700*i, 200);
    mundo.add(bloque4);
  }

  for (int i=0; i<8; i++) {

    bloque5= new Bloque(100, 50);
    bloque5.setFill(50);
    float valor4 = 95;
    float m4 = map(valor4, 0, 100, 0, 1);
    bloque5.setRestitution(m4);
    bloque5.setStatic(true);
    bloque5.adjustPosition(400*i, 600);
    mundo.add(bloque5);
  }
  //Péndulo 1
  FBox eje = new FBox(40, 40);
  eje.setStatic(true);
  originalX = 300;
  eje.setPosition(originalX, 50);
  mundo.add(eje);

  bolaC = new FCircle(100);
  bolaC.setPosition(300, 200);
  bolaC.setFill(255, 111, 111);
  mundo.add(bolaC);
  cadena = new FDistanceJoint(eje, bolaC);
  cadena.setLength(200);
  cadena.setStroke(2);
  mundo.add(cadena);

  goingRight = true;

  //Péndulo 2
  FBox eje2 = new FBox(40, 40);
  eje2.setStatic(true);
  originalX2 = 1200;
  eje2.setPosition(originalX2, 550);
  mundo.add(eje2);

  bolaC2 = new FCircle(100);
  bolaC2.setPosition(1200, 600);
  bolaC2.setFill(255, 111, 111);
  mundo.add(bolaC2);

  cadena2 = new FDistanceJoint(eje2, bolaC2);
  cadena2.setLength(200);
  cadena2.setStroke(2);
  mundo.add(cadena2);

  goingRight = true;

  caja = new Objetivo(120, 120);
  caja.inicializar(width/2, height-70);
  caja.setGrabbable(false);
  mundo.add(caja);
}

void draw() {
  background(255);
  mundo.step();
  mundo.draw();

  caja.mover();

  //cadena 1
  println(bolaC.getX());
  //bolaC.addImpulse(10, 0);
  if (bolaC.getX () > originalX + 180) {
    goingRight = false;
  } else if (bolaC.getX() < originalX - 180) {
    goingRight = true;
  }

  if (goingRight) {
    bolaC.setVelocity(200, -20);
  } else {
    bolaC.setVelocity(-200, -20);
  }
  //cadena 2
  println(bolaC2.getX());
  //bolaC2.addImpulse(10, 0);
  if (bolaC2.getX () > originalX2 + 180) {
    goingRight = false;
  } else if (bolaC2.getX() < originalX - 180) {
    goingRight = true;
  }

  if (goingRight) {
    bolaC2.setVelocity(200, -20);
  } else {
    bolaC2.setVelocity(-200, -20);
  }

  if (frameCount % 100 == 0 && frameCount< 1000) {
    FCircle circulo = new FCircle(30);
    circulo.setPosition(random(100, width-100), 50);
    circulo.setFill(200);
    bola.setDensity(0.1);
    mundo.add(circulo);
  }
  // Si la bola está en contacto con el Bloque 1, se le agrega una "fuerza" o un "impulso" para que no quede quieta en el lugar
  if (bola.isTouchingBody(bloque) == true) {
    bola.addForce(100, 0);
  }
}
