void inicializarBloquesFijos() {

  bloquesFijos = new Plataforma [40];

  // -- CENTRO
  bloquesFijos[0] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[0].iniciarBloquesFijos(width/2, 500, 0, 0);
  bloquesFijos[0].attachImage(choco);
  mundo.add(bloquesFijos[0]);


  // --- MITAD  DERECHA
  bloquesFijos[1] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[1].iniciarBloquesFijos(width/2 + (tamBloques*2), 550, 0, 0);
  bloquesFijos[1].attachImage(choco);
  mundo.add(bloquesFijos[1]);
  bloquesFijos[2] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[2].iniciarBloquesFijos(width/2 + (tamBloques*3), 400, 0, 0);
  bloquesFijos[2].attachImage(yapa[1]);
  mundo.add(bloquesFijos[2]);
  bloquesFijos[3] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[3].iniciarBloquesFijos(width/2 + (tamBloques*6), 400, 0, 0);
  bloquesFijos[3].attachImage(choco);
  mundo.add(bloquesFijos[3]);
  bloquesFijos[4] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[4].iniciarBloquesFijos(width/2 + (tamBloques*7), 400, 0, 0);
  bloquesFijos[4].attachImage(choco);
  mundo.add(bloquesFijos[4]);
  bloquesFijos[5] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[5].iniciarBloquesFijos(width/2 + (tamBloques*7), 450, 0, 0);
  bloquesFijos[5].attachImage(choco);
  mundo.add(bloquesFijos[5]);
  bloquesFijos[6] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[6].iniciarBloquesFijos(width/2 + (tamBloques*8), 450, 0, 0);
  bloquesFijos[6].attachImage(choco);
  mundo.add(bloquesFijos[6]);
  bloquesFijos[7] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[7].iniciarBloquesFijos(width/2 + (tamBloques*10), 350, 0, 0);
  bloquesFijos[7].attachImage(choco);
  mundo.add(bloquesFijos[7]);
  bloquesFijos[8] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[8].iniciarBloquesFijos(width/2 + (tamBloques*10), 400, 0, 0);
  bloquesFijos[8].attachImage(choco);
  mundo.add(bloquesFijos[8]);
  bloquesFijos[9] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[9].iniciarBloquesFijos(width/2 + (tamBloques*5), 700, 0, 0);
  bloquesFijos[9].attachImage(choco);
  mundo.add(bloquesFijos[9]);
  bloquesFijos[10] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[10].iniciarBloquesFijos(width/2 + (tamBloques*6), 700, 0, 0);
  bloquesFijos[10].attachImage(choco);
  mundo.add(bloquesFijos[10]);
  bloquesFijos[11] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[11].iniciarBloquesFijos(width/2 + (tamBloques*3), 650, 0, 0);
  bloquesFijos[11].attachImage(choco);
  mundo.add(bloquesFijos[11]);
  bloquesFijos[12] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[12].iniciarBloquesFijos(width/2 + (tamBloques*8), 650, 0, 0);
  bloquesFijos[12].attachImage(choco);
  mundo.add(bloquesFijos[12]);
  bloquesFijos[13] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[13].iniciarBloquesFijos(width/2 + (tamBloques*9), 650, 0, 0);
  bloquesFijos[13].attachImage(choco);
  mundo.add(bloquesFijos[13]);
  bloquesFijos[14] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[14].iniciarBloquesFijos(width/2 + (tamBloques*9), 600, 0, 0);
  bloquesFijos[14].attachImage(choco);
  mundo.add(bloquesFijos[14]);
  bloquesFijos[15] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[15].iniciarBloquesFijos(width/2 + (tamBloques*10), 800, 0, 0);
  bloquesFijos[15].attachImage(choco);
  mundo.add(bloquesFijos[15]);
  bloquesFijos[16] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[16].iniciarBloquesFijos(width/2 + tamBloques*3, 700, 0, 0);
  bloquesFijos[16].attachImage(choco);
  mundo.add(bloquesFijos[16]);
  bloquesFijos[25] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[25].iniciarBloquesFijos(width/2 +(tamBloques*10), 500, 0, 0);
  bloquesFijos[25].attachImage(choco);
  mundo.add(bloquesFijos[25]);
  // --- CENTRO


  // --- MITAD IZQUIERDA
  bloquesFijos[17] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[17].iniciarBloquesFijos(width/2 - (tamBloques*3), 400, 0, 0);
  bloquesFijos[17].attachImage(choco);
  mundo.add(bloquesFijos[17]);
  bloquesFijos[18] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[18].iniciarBloquesFijos(width/2 - (tamBloques*4), 450, 0, 0);
  bloquesFijos[18].attachImage(choco);
  mundo.add(bloquesFijos[18]);
  bloquesFijos[19] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[19].iniciarBloquesFijos(width/2 - (tamBloques*3), 450, 0, 0);
  bloquesFijos[19].attachImage(choco);
  mundo.add(bloquesFijos[19]);
  bloquesFijos[20] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[20].iniciarBloquesFijos(width/2 - (tamBloques*6), 450, 0, 0);
  bloquesFijos[20].attachImage(choco);
  mundo.add(bloquesFijos[20]);
  bloquesFijos[21] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[21].iniciarBloquesFijos(width/2 - (tamBloques*7), 400, 0, 0);
  bloquesFijos[21].attachImage(choco);
  mundo.add(bloquesFijos[21]);
  bloquesFijos[22] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[22].iniciarBloquesFijos(width/2 - (tamBloques*8), 400, 0, 0);
  bloquesFijos[22].attachImage(choco);
  mundo.add(bloquesFijos[22]);
  bloquesFijos[23] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[23].iniciarBloquesFijos(width/2 - (tamBloques*10), 350, 0, 0);
  bloquesFijos[23].attachImage(choco);
  mundo.add(bloquesFijos[23]);
  bloquesFijos[24] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[24].iniciarBloquesFijos(width/2 - (tamBloques*10), 400, 0, 0);
  bloquesFijos[24].attachImage(choco);
  mundo.add(bloquesFijos[24]);


  bloquesFijos[26] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[26].iniciarBloquesFijos(width/2 - (tamBloques*9), 500, 0, 0);
  bloquesFijos[26].attachImage(choco);
  mundo.add(bloquesFijos[26]);
  bloquesFijos[27] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[27].iniciarBloquesFijos(width/2 - (tamBloques*8), 550, 0, 0);
  bloquesFijos[27].attachImage(choco);
  mundo.add(bloquesFijos[27]);
  bloquesFijos[28] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[28].iniciarBloquesFijos(width/2 - (tamBloques*9), 650, 0, 0);
  bloquesFijos[28].attachImage(choco);
  mundo.add(bloquesFijos[28]);
  bloquesFijos[28] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[28].iniciarBloquesFijos(width/2 - (tamBloques*8), 650, 0, 0);
  bloquesFijos[28].attachImage(choco);
  mundo.add(bloquesFijos[28]);
  bloquesFijos[29] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[29].iniciarBloquesFijos(width/2 - (tamBloques*5), 700, 0, 0);
  bloquesFijos[29].attachImage(choco);
  mundo.add(bloquesFijos[29]);
  bloquesFijos[30] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[30].iniciarBloquesFijos(width/2 - (tamBloques*6), 700, 0, 0);
  bloquesFijos[30].attachImage(choco);
  mundo.add(bloquesFijos[30]);
  bloquesFijos[31] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[31].iniciarBloquesFijos(width/2 - (tamBloques), 650, 0, 0);
  bloquesFijos[31].attachImage(choco);
  mundo.add(bloquesFijos[31]);
  bloquesFijos[32] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[32].iniciarBloquesFijos(width/2 + (tamBloques*4), 800, 0, 0);
  bloquesFijos[32].attachImage(choco);
  mundo.add(bloquesFijos[32]);
  bloquesFijos[33] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[33].iniciarBloquesFijos(width/2 - (tamBloques*3), 700, 0, 0);
  bloquesFijos[33].attachImage(choco);
  mundo.add(bloquesFijos[33]);
  bloquesFijos[34] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[34].iniciarBloquesFijos(width/2 - (tamBloques*3), 650, 0, 0);
  bloquesFijos[34].attachImage(choco);
  mundo.add(bloquesFijos[34]);

  bloquesFijos[35] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[35].iniciarBloquesFijos(width/2 - (tamBloques*3), 650, 0, 0);
  bloquesFijos[35].attachImage(choco);
  mundo.add(bloquesFijos[35]);
  bloquesFijos[36] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[36].iniciarBloquesFijos(width/2 - (tamBloques*10), 800, 0, 0);
  bloquesFijos[36].attachImage(choco);
  mundo.add(bloquesFijos[36]);
  bloquesFijos[37] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[37].iniciarBloquesFijos(width/2 - (tamBloques*4), 800, 0, 0);
  bloquesFijos[37].attachImage(choco);
  mundo.add(bloquesFijos[37]);
  bloquesFijos[38] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[38].iniciarBloquesFijos(width/2, 650, 0, 0);
  bloquesFijos[38].attachImage(choco);
  mundo.add(bloquesFijos[38]);
  bloquesFijos[39] = new Plataforma(tamBloques, tamBloques);
  bloquesFijos[39].iniciarBloquesFijos(width/2 - tamBloques*2, 550, 0, 0);
  bloquesFijos[39].attachImage(choco);
  mundo.add(bloquesFijos[39]);
}
void inicializarBloquesMovibles() {

  bloquesMovibles = new Plataforma [40];

  bloquesMovibles[0] = new Plataforma(tamBloques, tamBloques);
  bloquesMovibles[0].iniciarBloquesMovibles(width/2 + (tamBloques*4), 400, 0);
  bloquesMovibles[0].attachImage(chocolateEnvoltorio);
  mundo.add(bloquesMovibles[0]);
}
