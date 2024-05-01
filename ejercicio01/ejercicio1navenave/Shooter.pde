class Shooter extends GameObject {
  private int vidas;
  private boolean disparando = false;
  private ArrayList<Proyectil> disparos = new ArrayList<Proyectil>();

  Shooter(float x, float y, PImage img, int vidas) {
    super(x, y, img);
    this.vidas = vidas;
  }

  void display() {
    image(imagen, posicion.x, posicion.y);
    
    // Mostrar los disparos
    for (Proyectil p : disparos) {
      p.mostrar();
    }
  }

  void mover() {
    // El movimiento del Shooter puede ser controlado por el Joypad
  }

  void disparar() {
    if (!disparando) {
      Proyectil nuevoProyectil = new Proyectil(posicion.x + imagen.width / 2, posicion.y - 20);
      disparos.add(nuevoProyectil);
      disparando = true;
    }
  }

  void actualizarDisparos() {
    for (int i = disparos.size() - 1; i >= 0; i--) {
      Proyectil p = disparos.get(i);
      p.mover();
      if (p.getY() < 0) {
        disparos.remove(i); // Eliminar el proyectil si sale de la pantalla
      }
    }
    disparando = false;
  }

  int getVidas() {
    return vidas;
  }

  void perderVida() {
    vidas--;
  }
}
