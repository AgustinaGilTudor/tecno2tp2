// Clase que reúne las características del objeto FBox y que usamos para crear los objetos cuadrados/rectangulares

class Bloque extends FBox {
  float w, h, tam;
  float originalXBolsa;

  boolean goingUp, goingRight;

  Bloque(float w_, float h_) {
    super(w_, h_);
  }

  void inicializar(float x_, float y_) {
    setPosition(x_, y_);
  }
  void inicializarBolsa(float x_, float y_) {
    setPosition(x_, y_);
    originalXBolsa = x_;
    goingRight = false;
    setGrabbable(false);
    setRestitution(0);
    setName("bolsa");
  }

  void inicializarEje(float x_, float y_) {
    setPosition(x_, y_);
    setSensor(true);
    setStatic(true);
    setNoStroke();
    setNoFill();
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
}
