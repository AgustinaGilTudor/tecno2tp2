class Objetivo extends FBox {

  float velocidad;
  Boolean goingRight;
  float originalX;

  Objetivo(float _w, float _h) {
    super(_w, _h);
  }

  void inicializar(float _x, float _y) {
    setPosition(_x, _y);
    originalX = _x;
    goingRight = true;
  }

  void mover() {
    if (getX() > originalX + 280) {
      goingRight = false;
    } else if (getX() < originalX - 280) {
      goingRight = true;
    }

    if (goingRight) {
      setVelocity(100, getVelocityY());
    } else {
      setVelocity(-100, getVelocityY());
    }
  }
}
