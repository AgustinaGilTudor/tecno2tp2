class Pendulo extends FWorld {

  Bloque ejeChupetin;
  Circulo chupetin;

  FDistanceJoint penduloChupetin;

  float tamEje, tamChupetin, penduloLength;
  
  Pendulo(float tamEje, float tamChupetin, float penduloLength) {
    this.tamEje = tamEje;
    this.tamChupetin = tamChupetin;
    this.penduloLength = penduloLength;   
  }

  void inicializarPendulos(float x_, float yEje_) {
    ejeChupetin = new Bloque(tamEje, tamEje);
    ejeChupetin.inicializarEje(x_, yEje_);
    mundo.add(ejeChupetin);
    
    chupetin = new Circulo(tamChupetin);
    chupetin.inicializarChupetin(x_, (yEje_ + 100) - tamChupetin/2);
    mundo.add(chupetin);
    
    penduloChupetin = new FDistanceJoint(ejeChupetin, chupetin);
    penduloChupetin.setLength(penduloLength);
    mundo.add(penduloChupetin);
  }

  void moverPendulos(float impulso) {
    chupetin.mover(impulso, -(impulso));
  }
  
}
