class Proyectil {
  private float x, y;
  private float velocidad = 10;

  Proyectil(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void mover() {
    y -= velocidad;
  }

  void mostrar() {
    fill(255, 0, 0);
    rect(x, y, 5, 10); // Rectángulo para representar el proyectil
  }

  float getY() {
    return y;
  }
}
