class Joypad {
  private Shooter shooter;
  private float velocidadAvion;

  Joypad(Shooter shooter, float velocidadAvion) {
    this.shooter = shooter;
    this.velocidadAvion = velocidadAvion;
  }

  void moverAvion() {
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        shooter.posicion.x -= velocidadAvion;
      } else if (key == 'd' || key == 'D') {
        shooter.posicion.x += velocidadAvion;
      }
    }
  }
}
