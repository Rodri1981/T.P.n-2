// GameObject.java
public abstract class GameObject {
    protected PVector position;

    public GameObject(float x, float y) {
        position = new PVector(x, y);
    }

    public abstract void display();
}
