class Caramelos extends FCircle {
  FCircle caramelo ;
  PImage c0, c1, c2, c3;
  Caramelos(float _t) {
    super(_t);
    //c0= loadImage("candy00.png");
    //c0.resize(40,40);
  }

  void dibujar(float _x, float _y) {
    adjustPosition(_x, _y);
    setVelocity(0, 200);
    setRestitution(0);
    setNoStroke();
    setFill(200, 30, 90);
    //setName("caramelo");

    //Distintos tipos de caramelo
    float porcentaje= random(100);
    if (porcentaje>0 && porcentaje<25) {
      setFill(0, 255, 0);
      //  attachImage(c0);
      setName("caramelo1");
    } else if (porcentaje>25 && porcentaje<50) {
      setFill(255, 0, 0);
      setName("caramelo2");
    } else if (porcentaje>50 && porcentaje<75) {
      setFill(100, 50, 0);
      setName("caramelo3");
    } else if (porcentaje>75 && porcentaje<100) {
      setFill(0, 0, 255);
      setName("caramelo4");
    }
  }
}
