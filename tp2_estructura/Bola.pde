// Clase que reúne las características del objeto FCircle y que usamos para crear los objetos redondos

class Circulo extends FCircle {

  PImage [] caramelo;
  int cantidadImagenes = 4;

  float originalX, velocidad, originalY;
  Boolean goingRight, goingUp;

  Circulo(float r_) {
    super(r_);

    caramelo = new PImage [cantidadImagenes];

    for (int i = 0; i < cantidadImagenes; i ++) {
      caramelo[i] = loadImage("candy" + nf(i, 2) + ".png");
    }
  }

  void dibujarCaramelos(float x_, float y_) {
    setPosition(x_, y_);
    
    // --- Distintos tipos de caramelos
    float porcentaje = random(100);

    if (porcentaje > 0 && porcentaje < 25) {
      attachImage(caramelo[0]);
      setRestitution(0.25);
      setName("Caramelo_Rosa");
    } else if (porcentaje > 25 && porcentaje < 50) {
      attachImage(caramelo[1]);
      setRestitution(0.50);
      setName("Caramelo_Violeta");
    } else if (porcentaje > 50 && porcentaje < 75) {
      attachImage(caramelo[2]);
      setRestitution(0.75);
      setName("Caramelo_Amarillo");
    } else if (porcentaje > 75) {
      attachImage(caramelo[3]);
      setRestitution(1);
      setName("Caramelo_Celeste");
    }
  }
  
  void dibujarCarameloInicio(float x_, float y_){
    setPosition(x_, y_);
    int cual = floor(random(0, 3));
    
    attachImage(caramelo[cual]);
    setRestitution(0);
    setName("Caramelo_Inicio");
  }

  void inicializarChupetin(float x_, float y_) {
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
