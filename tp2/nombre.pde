String conseguirNombre(FBody cuerpo) {

  String nombre= "nada";
  if (cuerpo != null) { //cuerpo en situaciones raras puede dar null
    nombre= cuerpo.getName();

    if (nombre== null) {
      nombre= "nada";
    }
  }
  //como no es un void (vacío), es un string, hay que hacer una variable return que devuelve un valor de tipo String
  return nombre;
}
