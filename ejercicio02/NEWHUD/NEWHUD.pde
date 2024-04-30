Dado dado;
String ultimoResultado = "";

void setup() {
  size(600, 600);
  dado = new Dado();
  dado.setPosicion(new PVector(width / 2, height / 2));
  dado.setLado(150);
}

void draw() {
  background(0);
  dado.dibujar();
  
  //Mostrar valor en la esquina superior derecha
  fill(255, 0, 0); //color rojo
  textSize(20);
  textAlign(RIGHT, TOP); //alinear a la derecha y arriba
  text("Ultimo resultado: " + ultimoResultado, width - 20, 20); //posicion del texto
}

void keyPressed() {
  if (key == ' ') {
    dado.tirarDado();
  } else if (key == 'f' || key == 'F') {
    finalizarJuego();
  }
}

void finalizarJuego() {
  // Mostrar los resultados de los dados en la consola
  ArrayList<Integer> resultados = dado.getResultados();
  int contador = 0;

  for (int resultado : resultados) {
    print(resultado + "\t");
    contador++;
    if (contador % 4 == 0) {
      println(); // Salto de línea después de cada fila de 4 números
    }
  }
  println(); // Salto de línea al final
}
