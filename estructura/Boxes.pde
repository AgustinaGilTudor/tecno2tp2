class Bloque extends FBox {

  float velocidad;
  Boolean goingRight, seMueve;
  float originalX;

  Bloque(float _w, float _h) {
    super(_w, _h);
  }
  void inicializar(float _x, float _y) {
    setPosition(_x, _y);
    originalX = _x;
    goingRight = true;
    seMueve = false;
    setRestitution(1);
  }
}
