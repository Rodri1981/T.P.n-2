class Asteroide extends GameObject {
  private float velocidad;

  Asteroide(float x, float y, PImage img, float velocidad) {
    super(x, y, img);
    this.velocidad = velocidad;
  }

  void display() {
    image(imagen, posicion.x, posicion.y);
  }

  void mover() {
    posicion.y += velocidad;
  }

  boolean colision(float xProyectil, float yProyectil) {
    float distancia = dist(xProyectil, yProyectil, posicion.x, posicion.y);
    return (distancia < imagen.width / 2);
  }
}
