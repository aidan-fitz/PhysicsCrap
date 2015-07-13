import java.util.*;

public class Field {
  
//  static final float COULOMB_CONSTANT
//    = 8_987_551_787.3681764; // N m^2 / C^2
  
  List<Particle> particles;
  
  public Field() {
    particles = new LinkedList<Particle>();
  }
  
  public void draw() {
    for (Particle p: particles) {
      p.draw();
      p.accel(value(p.position()));
    }
  }
  
  public PVector value(PVector pt) {
    PVector E = new PVector();
    for (Particle p: particles)
      E.add(p.myField(pt));
    return E;
  }
  
  public float potential(PVector pt) {
    float V = 0.0;
    for (Particle p: particles)
      V += p.myPotential(pt);
    return V;
  }
}
