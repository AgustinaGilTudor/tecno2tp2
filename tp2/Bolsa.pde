class Bolsa extends FBox {

  FBox bolsa;

  Bolsa(float _w, float _h) {
    super(_w, _h);
  }
  void inicializar(float _x, float _y) {
    setPosition(_x, _y);
    setName("bolsa");
    setStatic(true);
    setRestitution(0);
    setPosition(mouseX,height -50);
  }
 
 /* void actualizar() {
   adjustPosition(mouseX, height - 50);
  }*/
}
