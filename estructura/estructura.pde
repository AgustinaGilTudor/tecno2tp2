
/*Creación e inicialización del "mundo" de física*/
import fisica.*;
FWorld world;
void setup() {
  size(500, 500);

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(10, 300);
  world.setEdges();

  //piezas estáticas
  for (int i=0; i<5; i++) {
    FBox caja= new FBox(45, 20);
    world.add(caja);
    caja.setStatic(true);
    caja.setFill(255, 0, 0);
    caja.setRestitution(1.3);
    caja.setPosition(150*i, 100);
    caja.setGrabbable(false);
    world.add(caja);
  }
  for (int i=0; i<5; i++) {
    FBox caja= new FBox(45, 20);
    world.add(caja);
    caja.setStatic(true);
    caja.setFill(255, 0, 0);
    caja.setRestitution(1.3);
    caja.setPosition(250+60*i, 200);
    caja.setGrabbable(false);
    world.add(caja);
  }

  for (int i=0; i<3; i++) {
    FBox caja= new FBox(45, 20);
    world.add(caja);
    caja.setStatic(true);
    caja.setFill(255, 0, 0);
    caja.setRestitution(1.3);
    caja.setPosition(60*i, 300);
    caja.setGrabbable(false);
    world.add(caja);
  }

  //caramelo
  for (int i=0; i<3; i++) {
    FCircle pelota=new FCircle(10);
    world.add(pelota);
    pelota.setPosition(random(130, 300), 50);
    pelota.setRestitution(1.5);
  }
  //Malvaviscos
  FBox caja2= new FBox(40, 20);
  world.add(caja2);
  caja2.setStatic(true);
  caja2.setPosition(50, 125);
  caja2.setFill(0, 255, 0, 0);
  caja2.setStrokeColor(color(0, 0, 0, 0));
  caja2.setRestitution(0);
  FBlob myBlob = new FBlob();
  world.add(myBlob);
  myBlob.setAsCircle(50, 100, 30);
  myBlob.setStatic(true);
  myBlob.setGrabbable(false);
  myBlob.setRestitution(2);
  FBox caja4= new FBox(40, 20);
  world.add(caja4);
  caja4.setStatic(true);
  caja4.setPosition(345, 125);
  caja4.setFill(0, 255, 0, 0);
  caja4.setStrokeColor(color(0, 0, 0, 0));
  caja4.setRestitution(0);
  FBlob myBlob2 = new FBlob();
  world.add(myBlob2);
  myBlob2.setAsCircle(345, 100, 30);
  myBlob2.setStatic(true);
  myBlob2.setGrabbable(false);
  myBlob2.setRestitution(2);

  //piezas movibles
  for (int i=0; i<3; i++) {

    FBox caja3= new FBox(100, 20);
    world.add(caja3);
    caja3.setStatic(true);
    caja3.setPosition(random(width), random(height));
    caja3.setFill(0, 0, 255);
    caja3.setRestitution(0);
  }
}

void draw() {
  background(255);
  world.step();
  world.draw(this);
  int X=mouseX;
  int Y=mouseY;
  println("mouseX:"+mouseX);
  println("mouseY:"+mouseY);
}
