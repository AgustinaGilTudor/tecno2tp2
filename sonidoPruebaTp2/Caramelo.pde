// Clase que reúne las características del objeto FCircle y que usamos para crear los objetos redondos

class Caramelo extends FCircle {

  PImage [] caramelo;
  int cantidadImagenes = 4;

  float originalX, velocidad, carameloX, carameloY;
  Boolean goingRight, goingUp;

  Caramelo(float r_) {
    super(r_);

    caramelo = new PImage [cantidadImagenes];

    for (int i = 0; i < cantidadImagenes; i ++) {
      caramelo[i] = loadImage("candy" + nf(i, 2) + ".png");
    }
  }

  void dibujarCaramelos(float x_, float y_) {
    setPosition(x_, y_);
    //setGrabbable(false);

    // --- Distintos tipos de caramelos
    float porcentaje = random(100);

    if (porcentaje > 0 && porcentaje < 25) {
      attachImage(caramelo[0]);
      setRestitution(0.25);
      setName("caramelo_rosa");
    } else if (porcentaje > 25 && porcentaje < 50) {
      attachImage(caramelo[1]);
      setRestitution(0.50);
      setName("caramelo_violeta");
    } else if (porcentaje > 50 && porcentaje < 75) {
      attachImage(caramelo[2]);
      setRestitution(0.75);
      setName("caramelo_amarillo");
    } else if (porcentaje > 75) {
      attachImage(caramelo[3]);
      setRestitution(1);
      setName("caramelo_celeste");
    }
  }

  void dibujarCarameloInicio(float x_, float y_) {
    setPosition(x_, y_);
    carameloX = x_;
    carameloY = y_;
    int cual = floor(random(0, 3));

    attachImage(caramelo[cual]);
    setRestitution(0);
    setName("caramelo_inicio");
  }

  void resetearCarameloInicio() {
    setPosition(carameloX, carameloY);
  }

  void resetear() {
    mundo.remove(this);
  }
  void iniciarCaramelera(float x_, float y_){
    setPosition(x_, y_);
    setStatic(true);
    setGrabbable(false);
  }
  
  void iniciarChupetin(float x_, float y_) {
    setPosition(x_, y_);
    setRestitution(1);
    originalX = x_;
    goingRight = false;
  }

  void mover(float velocidad_l, float velocidad_r) {
    if (getX() > originalX + 90) {
      goingRight = false;
    } else if (getX() < originalX - 90) {
      goingRight = true;
    }

    if (goingRight) {
      setVelocity(velocidad_l, 0);
    } else {
      setVelocity(velocidad_r, 0);
    }
  }
}
