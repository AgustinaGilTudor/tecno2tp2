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

void contactStarted(FContact contact) {
  FBody uno = contact.getBody1();
  FBody dos = contact.getBody2();

  String nombreUno = conseguirNombre(uno);
  String nombreDos = conseguirNombre(dos);

  if (estado.equals( "inicio" )) {
    if (hayColisionEntre( contact, "caramelo_inicio", "bolsa")) {
      estado = "jugando";
    }
  }

  if (estado.equals("jugando")) {

    if ((nombreUno == "caramelo_rosa" && nombreDos == "movible") || (nombreUno == "movible" && nombreDos == "caramelo_rosa")) {
      rebote.trigger();
    } else if ((nombreUno == "caramelo_violeta" && nombreDos == "fijo") || (nombreUno == "fijo" && nombreDos == "caramelo_violeta")) {
      rebote.trigger();
    } else if ((nombreUno == "caramelo_amarillo" && nombreDos == "fijo") || (nombreUno == "fijo" && nombreDos == "caramelo_amarillo")) {
      rebote.trigger();
    } else if ((nombreUno == "caramelo_celeste" && nombreDos == "fijo") || (nombreUno == "fijo" && nombreDos == "caramelo_celeste")) {
      rebote.trigger();
    }


    // Colisión entre la bolsa y la bolsa
    if ((uno == bolsa || dos == bolsa) && (uno != piso && dos != piso)) {
      FBody ball = null;
      if (uno == bolsa && nombreDos != "movible") {
        ball = dos;
      } else if (dos == bolsa && nombreUno != "movible") {
        ball = uno;
      }
      if (ball == null) {
        return;
      }
      if (contact.getVelocityY() > 0) {
        mundo.remove(ball);
      }
      // Puntaje
      if (ball.getName() == "caramelo_rosa") {
        puntos += 10;
        sumarPuntos.trigger();
      } else if (ball.getName() == "caramelo_violeta") {
        puntos += 15;
        sumarPuntos.trigger();
      } else if (ball.getName() == "caramelo_amarillo") {
        puntos += 20;
        sumarPuntos.trigger();
      } else if (ball.getName() == "caramelo_celeste") {
        puntos +=30;
        sumarPuntos.trigger();
      }
    }

    // Colisión con el piso
    if ((uno != bolsa && dos == piso) || (uno == piso && dos != bolsa)) {
      FBody ball = null;
      if (uno == piso && nombreDos != "bolsa") {
        ball = dos;
      } else if (dos == piso && nombreUno != "bolsa") {
        ball = uno;
      }
      if (ball == null) {
        return;
      }
      mundo.remove(ball);
      // Puntaje
      if (ball.getName() == "caramelo_rosa") {
        restarPuntosYVidas(10);
      } else if (ball.getName() == "caramelo_violeta") {
        restarPuntosYVidas(15);
      } else if (ball.getName() == "caramelo_amarillo") {
        restarPuntosYVidas(20);
      } else if (ball.getName() == "caramelo_celeste") {
        restarPuntosYVidas(30);
      }
    }
  }
}

void restarPuntosYVidas( float valor ) {
  if (puntos >= valor) {
    puntos -= valor;
  } else {
    estado = "fin_puntos";
    sonidoPerder.trigger();
  }
  if (vidas > 1) {
    vidas -= 1;
  } else {
    estado = "fin_vidas";
    sonidoFin.trigger();
  }
}

boolean hayColisionEntre(FContact contact, String nombreUno, String nombreDos) {
  boolean resultado = false;
  FBody uno = contact.getBody1();
  FBody dos = contact.getBody2();
  String etiquetaUno = uno.getName();
  String etiquetaDos = dos.getName();

  if (etiquetaUno != null && etiquetaDos != null) {
    if (nombreUno.equals( etiquetaUno ) && nombreDos.equals( etiquetaDos ) || (nombreUno.equals( etiquetaDos ) && nombreDos.equals( etiquetaUno ))) {
      resultado = true;
    }
  }
  return resultado;
}

void agregarCaramelos() {
  for (int i = 0; i < 2; i ++) {
    caramelos[i] = new Caramelo(40);
    caramelos[i].dibujarCaramelos(width/2, 210+i*2);
    mundo.add(caramelos[i]);
  }
}

void resetear() {
  if (caramelos.length > 0) {
    for (int i = 0; i < caramelos.length; i++) {
      mundo.remove(caramelos[i]);
    }
  }
  valorOpacidad = 150;
  sub_estado = "";
  contadorCaramelos = 0;
  contadorInstrucciones = 0;
  vidas = 5;
  puntos = 0;
}
