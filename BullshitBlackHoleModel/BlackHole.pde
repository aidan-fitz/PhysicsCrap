public class BlackHole {
  
  // Coords of the singularity
  private PVector position;
  private float mass;
  
  public BlackHole(float x, float y, float m) {
    position = new PVector(x, y);
    mass = m;
  }
  
  public void draw() {
    
  }
  
  /**
   * The Schwarzschild radius of the hole.
   */
  public float radius() {
    return 0;
  }
  
  /**
   * The gravitational field at the specified point.
   */
  public PVector field(PVector point) {
    PVector direction = point.sub(position);
    float magnitude = G*mass / direction.magSq();
    direction.normalize();
    return direction.mult(magnitude);
  }
}
