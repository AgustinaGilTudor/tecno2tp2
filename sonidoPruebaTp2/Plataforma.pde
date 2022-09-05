// Clase que reúne las características del objeto FBox y que usamos para crear los objetos cuadrados/rectangulares

class Plataforma extends FBox {
  float w, h, tam;
  float originalXBolsa, originalX, originalY;
  float tamBloques;
  boolean goingUp, goingRight;
  PImage imgBolsa;

  Plataforma(float w_, float h_) {
    super(w_, h_);
    tamBloques = 50;
  }

  void inicializar(float x_, float y_) {
    setPosition(x_, y_);
  }
  
  void inicializarBloquesDiagonales(float x_, float y_, float r_) {
    setPosition(x_, y_);
    setStatic(true);
    setRotation(radians(r_));
    setName("diagonal");
    setGrabbable(false);
  }
  void iniciarBloquesFijos(float x_, float y_, float r_, float n_) {
    setPosition(x_, y_ - ((tamBloques/2)));
    setRestitution(r_);
    setStatic(true);
    setGrabbable(false);
    setFillColor(#8CEAE3);
    setRotation(radians(n_));
    setName("fijo");
  }

  void iniciarBloquesMovibles(float x_, float y_, float r_) {
    originalX = x_;
    originalY = y_;
    setPosition(x_, y_ - ((tamBloques/2)));
    setRestitution(r_);
    setStatic(true);
    setFillColor(#EA8C8C);
    setName("movible");
  }

  void inicializarBolsa(float x_, float y_) {
    imgBolsa = loadImage("bolsa00.png");
    setPosition(x_, y_);
    setRestitution(0);

    originalXBolsa = x_;
    goingRight = false;
    setGrabbable(false);
    setRestitution(0);
    setName("bolsa");
    attachImage(imgBolsa);
  }

  void inicializarEje(float x_, float y_) {
    setPosition(x_, y_);
    setSensor(true);
    setStatic(true);
    setNoStroke();
    setNoFill();
  }

  void iniciarPiso(float x_, float y_) {
    setPosition(x_, y_);
    setNoFill();
    setNoStroke();
    setStatic(true);
    setName("piso");
    setRestitution(0);
  }

  void moverBolsa() {
    if (getX() > originalXBolsa + 400) {
      goingRight = false;
    } else if (getX() < originalXBolsa - 400) {
      goingRight = true;
    }

    if (goingRight) {
      setVelocity(150, getVelocityY());
    } else {
      setVelocity(-150, getVelocityY());
    }
  }

  void resetearBloquesMovibles() {
    setPosition(originalX, originalY - ((tamBloques/2)));
  }
}
