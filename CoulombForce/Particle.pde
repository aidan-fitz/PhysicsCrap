public class Particle {
  
  private int charge; // elementary charge units
  
  private PVector pos, vel;
  
  public Particle(float x, float y, int q) {
    pos = new PVector(x, y);
    charge = q;
  }
  
  public void draw() {
    if (charge > 0)
      fill(255, 0, 0);
    else
      fill(0, 0, 255);
    
    ellipse(pos.x, pos.y, 5, 5);
    
    // TODO: Display a label below if selected
    
    // update position
    pos.add(vel);
  }
  
  public PVector position() {
    return pos;
  }
  
  public PVector velocity() {
    return vel;
  }
  
  public void accel(PVector a) {
    vel.add(a);
  }
    
  // My electric field at point "pt"
  public PVector myField(PVector pt) {
    float dist = pos.dist(pt);
    // zero at my location
    if (dist == 0)
      return new PVector();
    
    // get a unit vector pointing from pos to pt
    PVector e = PVector.sub(pt, pos);
    e.normalize();
    e.mult(charge / (dist*dist));
    return e;
  }
  
  public float myPotential(PVector pt) {
    float dist = pos.dist(pt);
    // zero at my location
    if (dist == 0)
      return 0.0;
    
    return charge / dist;
  }
}
