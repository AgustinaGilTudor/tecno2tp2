class BloqueF extends FBody {

  Bloque bloque;
  int tamBloques;
  PImage imagen;

  BloqueF(int tamBloques) {
    this.tamBloques = tamBloques;
    bloque = new Bloque(tamBloques, tamBloques);
    imagen = loadImage("flynnpaff.png");
  }

  void inicializarBloquesFijos(float x_, float y_, float r_, float n_) {
    bloque.setPosition(x_ - (tamBloques/2), y_ - ((tamBloques/2)));
    bloque.setRestitution(r_);
    bloque.setStatic(true);
    bloque.setGrabbable(false);
    bloque.setFillColor(#8CEAE3);
    bloque.setRotation(radians(n_));

    mundo.add(bloque);
  }
  
  void inicializarBloquesDiagonales(float x_, float y_, float r_){
    bloque = new Bloque(100, tamBloques/2);
    bloque.setPosition(x_, y_);
    bloque.setStatic(true);
    bloque.setRotation(radians(r_));
    bloque.setGrabbable(false);
    
    mundo.add(bloque);
  }
  
}
