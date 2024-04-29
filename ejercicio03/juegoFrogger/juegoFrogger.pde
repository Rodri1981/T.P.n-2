PImage frogImage, carImage, logImage, turtleImage, truckImage;
ArrayList<GameObject> gameObjects;

void setup() {
  size(1000, 600);
  background(0);

  // Cargar imágenes
  frogImage = loadImage("frog.png");
  carImage = loadImage("car.png");
  logImage = loadImage("log.png");
  turtleImage = loadImage("turtle.png");
  truckImage = loadImage("truck.png");

  // Inicializar la lista de objetos del juego
  gameObjects = new ArrayList<GameObject>();

  // Agregar elementos al juego
  gameObjects.add(new Frog(400, 550, 50, 50));
  gameObjects.add(new Car(100, 500, 80, 50));
  gameObjects.add(new Car(300, 500, 80, 50));
  gameObjects.add(new Car(580, 500, 80, 50));
  gameObjects.add(new Log(100, 100, 120, 40, logImage)); // Agreg tronco grande
  gameObjects.add(new Log(400, 130, 120, 40, logImage)); // Agreg tronco grande
  gameObjects.add(new Log(600, 130, 120, 40, logImage)); // Agreg tronco grande
  gameObjects.add(new Log(300, 130, 80, 40, logImage));  // Agreg tronco pequeño
  gameObjects.add(new Log(100, 180, 80, 40, logImage));  // Agreg tronco pequeño
  gameObjects.add(new Log(500, 180, 80, 40, logImage));  // Agreg tronco pequeño
  gameObjects.add(new Log(600, 180, 80, 40, logImage));  // Agreg tronco pequeño
  gameObjects.add(new Turtle(200, 230, 70, 50));
  gameObjects.add(new Turtle(300, 230, 70, 50));
  gameObjects.add(new Turtle(400, 230, 70, 50));
  gameObjects.add(new Turtle(600, 230, 70, 50));
  gameObjects.add(new Turtle(700, 230, 70, 50));
  gameObjects.add(new Truck(0, 400, 80, 40));
  gameObjects.add(new Truck(200, 400, 80, 40));
  gameObjects.add(new Truck(320, 400, 80, 40));
  gameObjects.add(new Truck(600, 400, 80, 40));
  gameObjects.add(new Truck(720, 400, 80, 40));
}

void draw() {
  background(0);

  // Dibujar la calle (vereda)
  fill(#690CED);
  rect(0, height/2 - 25, width, 50);
  fill(#690CED);
  rect(0, height/2 + 245, width, 50);
  fill(#6AF755);
  rect(0, height/2 - 300, width, 80);

  // Dibujar los objetos del juego
  for (GameObject obj : gameObjects) {
    obj.display();
  }
}
