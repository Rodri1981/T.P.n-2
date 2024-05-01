class HUD {
  private Shooter shooter;

  HUD(Shooter shooter) {
    this.shooter = shooter;
  }

  void mostrar() {
    fill(255);
    textSize(20);
    text("Vidas: " + shooter.getVidas(), 20, 30);
  }
}
