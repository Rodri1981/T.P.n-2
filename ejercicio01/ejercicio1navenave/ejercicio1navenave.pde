Shooter shooter;
HUD hud;
Joypad joypad;
ArrayList<Asteroide> asteroides = new ArrayList<Asteroide>();
int tasaCreacionAsteroides = 60;

void setup() {
  size(800, 600);

  PImage shooterImg = loadImage("shooter.png");
  shooter = new Shooter(width / 2, height - 100, shooterImg, 3); // Inicializar Shooter con 3 vidas

  hud = new HUD(shooter);
  joypad = new Joypad(shooter, 5); // Velocidad de movimiento del Joypad
}

void draw() {
  background(0);

  // Control del movimiento del Shooter
  joypad.moverAvion();

  // Mostrar y mover el Shooter
  shooter.display();
  shooter.mover();

  // Actualizar y mostrar los disparos
  shooter.actualizarDisparos();

  // Crear nuevos asteroides
  if (frameCount % tasaCreacionAsteroides == 0) {
    asteroides.add(new Asteroide(random(width), -50, loadImage("asteroide.png"), random(2, 5)));
  }

  // Mover y mostrar los asteroides
  for (int i = asteroides.size() - 1; i >= 0; i--) {
    Asteroide ast = asteroides.get(i);
    ast.mover();
    ast.display();

    // Verificar colisión con el Shooter
    if (ast.colision(shooter.posicion.x, shooter.posicion.y)) {
      shooter.perderVida();
      asteroides.remove(i);
      if (shooter.getVidas() <= 0) {
        gameOver();
      }
    }
  }

  // Mostrar el HUD
  hud.mostrar();
}

void keyPressed() {
  if (key == ' ') { // Disparar al presionar la barra espaciadora
    shooter.disparar();
  }
}

void gameOver() {
  textSize(40);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2);
  noLoop(); // Detener el juego
}
