abstract class GameObject {
  protected PVector posicion;
  protected PImage imagen;

  GameObject(float x, float y, PImage img) {
    posicion = new PVector(x, y);
    imagen = img;
  }

  abstract void display();
  abstract void mover();
}
