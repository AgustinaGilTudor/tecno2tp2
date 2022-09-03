class BloqueM extends FWorld {

  Bloque bloque;
  int tamBloques;

  BloqueM() {
    tamBloques = 50;
    bloque = new Bloque(tamBloques, tamBloques);
  }

  void inicializarBloquesMovibles(float x_, float y_, float r_) {
    bloque.setPosition(x_ - (tamBloques/2), y_ - ((tamBloques/2)));
    bloque.setRestitution(r_);
    bloque.setStatic(true);
    bloque.setFillColor(#EA8C8C);
    mundo.add(bloque);
  }
}
