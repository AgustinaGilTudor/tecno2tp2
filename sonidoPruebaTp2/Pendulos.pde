class Pendulo extends FBody {

  Plataforma ejeChupetin;
  Caramelo chupetin;

  FDistanceJoint penduloChupetin;

  float tamEje, tamChupetin, penduloLength;
  PImage imgChupetin;
  Pendulo(float tamEje, float tamChupetin, float penduloLength) {
    this.tamEje = tamEje;
    this.tamChupetin = tamChupetin;
    this.penduloLength = penduloLength;    
  }

  void inicializarPendulos(float x_, float yEje_) {
    imgChupetin = loadImage("chupetin.png");
    ejeChupetin = new Plataforma(tamEje, tamEje);
    ejeChupetin.inicializarEje(x_, yEje_);
    mundo.add(ejeChupetin);
    
    chupetin = new Caramelo(tamChupetin);
    chupetin.iniciarChupetin(x_, (yEje_ + 100) - tamChupetin/2);
    mundo.add(chupetin);
    
    penduloChupetin = new FDistanceJoint(ejeChupetin, chupetin);
    penduloChupetin.setLength(penduloLength);
    mundo.add(penduloChupetin);
  }

  void moverPendulos(float impulso) {
    chupetin.mover(impulso, -(impulso));
  }
  
}
