// Función para acceder al nombre de un objeto
String conseguirNombre(FBody cuerpo) {

  String nombre = "nada";

  if (cuerpo != null) {
    nombre = cuerpo.getName();

    if (nombre == null) {
      nombre = "nada";
    }
  }

  return nombre;
}

void contactStarted(FContact c) {
  FBody cuerpo1 = c.getBody1();
  FBody cuerpo2 = c.getBody2();

  // Colisión con la bolsa
  if (cuerpo1 == bolsa || cuerpo2 == bolsa && cuerpo1 != piso && cuerpo2 != piso) {
    FBody ball = null;
    if (cuerpo1 == bolsa) {
      ball = cuerpo2;
    } else if (cuerpo2 == bolsa) {
      ball = cuerpo1;
    }

    if (ball == null) {
      return;
    }
    mundo.remove(ball);

    if (ball.getName() == "Caramelo_Rosa") {
      puntos += 10;
      sumarPuntos.trigger();
    } else if (ball.getName() == "Caramelo_Violeta") {
      puntos += 15;
      sumarPuntos.trigger();
    } else if (ball.getName() == "Caramelo_Amarillo") {
      puntos += 20;
      sumarPuntos.trigger();
    } else if (ball.getName() == "Caramelo_Celeste") {
      puntos += 30;
      sumarPuntos.trigger();
    }

    println(puntos);
  }

  // Colisión con el piso
  if (cuerpo1 != bolsa && cuerpo2 != bolsa && cuerpo1 == piso || cuerpo2 == piso) {
    FBody ball = null;
    if (cuerpo1 == piso) {
      ball = cuerpo2;
    } else if (cuerpo2 == piso) {
      ball = cuerpo1;
    }
    if (ball == null) {
      return;
    }
    sonidoPiso.trigger();
    mundo.remove(ball);
  }
}

void agregarCaramelos() {
  Circulo [] caramelos;
  caramelos = new Circulo[4];
  sonidoCaramelera.trigger();
  for (int i = 0; i < 3; i ++) {
    caramelos[i] = new Circulo(40);
    caramelos[i].dibujarCaramelos(width/2, 70+i*2);
    mundo.add(caramelos[i]);
  }
}
