class Ion {
  
  private int Z;
  private float mass;
  private PVector d, v;
  
  public Ion(int atomicNumber, float speed) {
    Z = atomicNumber;
    
    // start at left side of screen
    d = new PVector(0, random(100));
    // initial velocity is horizontal
    v = new PVector(speed, 0);
  }
}
