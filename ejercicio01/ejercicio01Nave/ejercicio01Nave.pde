ArrayList<Asteroide> asteroides = new ArrayList<Asteroide>();
ArrayList<Disparo> disparos = new ArrayList<Disparo>();
Nave nave;
int puntuacion = 0;
int nivel = 1;
boolean gameOver = false;
int tiempoDisparo = 0; // Variable para controlar el tiempo entre disparos
int intervaloDisparo = 20; // Intervalo de tiempo entre disparos

void setup() {
  size(800, 600);
  nave = new Nave();
  
  // Inicializar asteroides
  for (int i = 0; i < nivel * 8; i++) {
    asteroides.add(new Asteroide(random(width), random(height), random(15, 60)));
  }
}

void draw() {
  background(0);
  
  if (!gameOver) {
    // Manejar los controles de la nave
    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        nave.girar(-0.1);
      } else if (key == 'd' || key == 'D') {
        nave.girar(0.1);
      } else if (key == 'w' || key == 'W') {
        nave.impulsar(0.5); // Aumentar la velocidad de avance
      } else if (key == 's' || key == 'S') {
        nave.impulsar(-0.3); // Ajustar la velocidad de retroceso
      }
    }
  
    // Dibujar y mover la nave
    nave.mostrar();
    nave.actualizar();
  
    // Manejar los disparos
    if (keyPressed && key == ' ' && tiempoDisparo <= 0) {
      nave.disparar();
      tiempoDisparo = intervaloDisparo;
    }
    
    // Reducir el tiempo de disparo
    tiempoDisparo = max(0, tiempoDisparo - 1);
    
    for (int i = nave.disparos.size() - 1; i >= 0; i--) {
      Disparo d = nave.disparos.get(i);
      d.mostrar();
      d.mover();
      
      // Chequear colisión con asteroides
      for (int j = asteroides.size() - 1; j >= 0; j--) {
        Asteroide a = asteroides.get(j);
        if (d.colisiona(a)) {
          // Dividir el asteroide si es lo suficientemente grande
          if (a.tamano > 15) {
            ArrayList<Asteroide> nuevosAsteroides = a.dividir();
            asteroides.addAll(nuevosAsteroides);
          }
  
          // Eliminar el asteroide
          asteroides.remove(j);
          nave.disparos.remove(i);
          puntuacion += 10; // Aumentar puntuación
          break; // Salir del bucle de asteroides
        }
      }
  
      // Remover disparos que salen de la pantalla
      if (d.x < 0 || d.x > width || d.y < 0 || d.y > height) {
        nave.disparos.remove(i);
      }
    }
  
    // Dibujar y mover asteroides
    for (int i = asteroides.size() - 1; i >= 0; i--) {
      Asteroide a = asteroides.get(i);
      a.mostrar();
      a.mover();
    }
    
    // Chequear condición de victoria
    if (asteroides.isEmpty()) {
      nivel++;
      puntuacion += 1000; // Bonificación por completar nivel
      asteroides.clear();
      for (int i = 0; i < nivel * 8; i++) {
        asteroides.add(new Asteroide(random(width), random(height), random(15, 60)));
      }
    }
  
    // Mostrar puntuación
    fill(255);
    text("Puntuación: " + puntuacion, 10, 20);
    text("Nivel: " + nivel, 10, 40);
  } else {
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
  }
}

class Nave {
  PVector posicion;
  PVector velocidad;
  float aceleracion = 0.1;
  float angulo = -PI / 2; // Iniciar apuntando hacia arriba
  ArrayList<Disparo> disparos;
  
  Nave() {
    posicion = new PVector(width / 2, height / 2);
    velocidad = new PVector(0, 0);
    disparos = new ArrayList<Disparo>();
  }
  
  void mostrar() {
    pushMatrix();
    translate(posicion.x, posicion.y);
    rotate(angulo + PI / 2); // Ajuste para rotar correctamente
    fill(255);
    triangle(-10, 20, 10, 20, 0, -20);
    popMatrix();
  }
  
  void actualizar() {
    posicion.add(velocidad);
    velocidad.mult(0.99); // Simular fricción o resistencia
    
    // Wrap around screen edges
    if (posicion.x > width) posicion.x = 0;
    if (posicion.x < 0) posicion.x = width;
    if (posicion.y > height) posicion.y = 0;
    if (posicion.y < 0) posicion.y = height;
  }
  
  void girar(float angulo) {
    this.angulo += angulo;
  }
  
  void impulsar(float velocidad) {
    // Convertir ángulo y aceleración en vector de velocidad
    PVector fuerza = PVector.fromAngle(angulo);
    fuerza.mult(aceleracion * velocidad);
    this.velocidad.add(fuerza);
  }
  
  void disparar() {
    // Coordenadas de la segunda punta más larga de la nave
    float x1 = posicion.x + 20 * cos(angulo);
    float y1 = posicion.y + 20 * sin(angulo);
    disparos.add(new Disparo(x1, y1, angulo));
  }
}

class Disparo {
  float x, y, velocidad = 5;
  float angulo;
  
  Disparo(float x, float y, float angulo) {
    this.x = x;
    this.y = y;
    this.angulo = angulo;
  }
  
  void mostrar() {
    fill(255, 0, 0);
    ellipse(x, y, 5, 5);
  }
  
  void mover() {
    x += cos(angulo) * velocidad;
    y += sin(angulo) * velocidad;
  }
  
  boolean colisiona(Asteroide a) {
    float d = dist(x, y, a.posicion.x, a.posicion.y);
    return d < a.tamano;
  }
}

class Asteroide {
  PVector posicion;
  PVector velocidad;
  float tamano;
  
  Asteroide(float x, float y, float tamano) {
    posicion = new PVector(x, y);
    velocidad = PVector.random2D();
    this.tamano = tamano;
  }
  
  void mostrar() {
    noFill();
    stroke(255);
    ellipse(posicion.x, posicion.y, tamano * 2, tamano * 2);
  }
  
  void mover() {
    posicion.add(velocidad);
    
    // Permitir que los asteroides aparezcan del otro lado de la pantalla
    if (posicion.x > width) posicion.x = 0;
    if (posicion.x < 0) posicion.x = width;
    if (posicion.y > height) posicion.y = 0;
    if (posicion.y < 0) posicion.y = height;
  }
  
  // Método para dividir el asteroide
  ArrayList<Asteroide> dividir() {
    ArrayList<Asteroide> nuevos = new ArrayList<Asteroide>();
    nuevos.add(new Asteroide(posicion.x, posicion.y, tamano / 2));
    nuevos.add(new Asteroide(posicion.x, posicion.y, tamano / 2));
    return nuevos;
  }
}
