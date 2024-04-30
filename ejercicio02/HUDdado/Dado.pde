public class Dado extends GameObject {
    private int valor;
    private int lado;
    private PImage[] imagenes;
    private ArrayList<Integer> resultados;

    public Dado(float x, float y) {
        super(x, y);
        valor = 1;
        resultados = new ArrayList<Integer>();
        imagenes = new PImage[6];
        for (int i = 0; i < 6; i++) {
            imagenes[i] = loadImage("Dado" + (i + 1) + ".png");
        }
        lado = 100; // Valor predeterminado para el lado del dado
    }

    public void setLado(int lado) {
        this.lado = lado;
    }

    public void tirarDado() {
        valor = (int) random(1, 7);
        resultados.add(valor);
    }

    @Override
    public void display() {
        imageMode(CENTER);
        image(imagenes[valor - 1], position.x, position.y, lado, lado); // Mostrar la imagen con el tamaño del lado
    }

    public ArrayList<Integer> getResultados() {
        return resultados;
    }
}
