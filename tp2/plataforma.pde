class Plataforma extends FBox{

  FBox cuerpo;

  Plataforma(float _w, float _h) {
   // cuerpo= new FBox(_w, _h);
  super(_w, _h);  
}
  void inicializar(float _x, float _y) {
    setPosition(_x, _y);
    setName("plataforma");
    setStatic(true);
  }
}
