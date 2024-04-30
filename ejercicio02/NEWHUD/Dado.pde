import java.util.ArrayList;

class Dado {
  
  private int valor;
  private int lado;
  private PVector posicion;
  private ArrayList<Integer> resultados;

  public Dado() {
    valor = 1;
    resultados = new ArrayList<Integer>();
  }
  
  public void setPosicion(PVector posicion) {
    this.posicion = posicion;
  }
  
  public void setLado(int lado) {
    this.lado = lado;
  }
  
  public void tirarDado() {
    valor = (int) random(1, 7);
    resultados.add(valor); // Agregar el resultado al ArrayList de resultados
  }
  
  public void dibujar() {
    rectMode(CENTER);
    strokeWeight(1);
    fill(255);
    square(posicion.x, posicion.y, lado);
    fill(0);
    strokeWeight(5);
    switch (valor) {
      case 1:
        point(posicion.x, posicion.y);
        break;
      case 2:
        point(posicion.x - lado/4, posicion.y - lado/4);
        point(posicion.x + lado/4, posicion.y + lado/4);
        break;
      case 3:
        point(posicion.x, posicion.y);
        point(posicion.x - lado/4, posicion.y - lado/4);
        point(posicion.x + lado/4, posicion.y + lado/4);
        break;
      case 4:
        point(posicion.x - lado/4, posicion.y - lado/4);
        point(posicion.x + lado/4, posicion.y + lado/4);
        point(posicion.x - lado/4, posicion.y + lado/4);
        point(posicion.x + lado/4, posicion.y - lado/4);
        break;
      case 5:
        point(posicion.x, posicion.y);
        point(posicion.x - lado/4, posicion.y - lado/4);
        point(posicion.x + lado/4, posicion.y + lado/4);
        point(posicion.x - lado/4, posicion.y + lado/4);
        point(posicion.x + lado/4, posicion.y - lado/4);
        break;
      case 6:
        for (int i = -1; i <= 1; i++) {
          point(posicion.x - lado/4, posicion.y + i * lado/4);
          point(posicion.x + lado/4, posicion.y + i * lado/4);
        }
        break;
    }
  }
  
  public ArrayList<Integer> getResultados() {
    return resultados;
  }
  
}
