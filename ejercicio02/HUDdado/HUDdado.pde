// HUD.pde
Dado dado;
String ultimoResultado = "";
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void setup() {
    size(600, 600);
    Dado dado = new Dado(width / 2, height / 2);
    dado.setLado(150);
    gameObjects.add(dado);
}

void draw() {
    background(0);
    for (GameObject obj : gameObjects) {
        obj.display();
        //Mostrar valor en la esquina superior derecha
  fill(255, 0, 0); //color rojo
  textSize(20);
  textAlign(RIGHT, TOP); //alinear a la derecha y arriba
  text("Ultimo resultado: " + ultimoResultado, width - 20, 20); //posicion del texto
    }
}

void keyPressed() {
    if (key == ' ') {
        for (GameObject obj : gameObjects) {
            if (obj instanceof Dado) {
                Dado dado = (Dado) obj;
                dado.tirarDado();
            }
        }
    } else if (key == 'f' || key == 'F') {
        finalizarJuego();
    }
}

void finalizarJuego() {
    for (GameObject obj : gameObjects) {
        if (obj instanceof Dado) {
            Dado dado = (Dado) obj;
            ArrayList<Integer> resultados = dado.getResultados();
            int contador = 0;
            println("Resultados del dado:");
            for (int resultado : resultados) {
                print(resultado + "\t");
                contador++;
                if (contador % 4 == 0) {
                    println(); // Salto de línea después de cada fila de 4 números
                }
            }
            println(); // Salto de línea al final
        }
    }
}
