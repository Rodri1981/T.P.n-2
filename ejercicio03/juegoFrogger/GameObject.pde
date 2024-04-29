class GameObject {
  float x, y, width, height;
  PImage sprite;

  GameObject(float x, float y, float width, float height, PImage sprite) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.sprite = sprite;
  }

  void display() {
    image(sprite, x, y, width, height);
  }
}
