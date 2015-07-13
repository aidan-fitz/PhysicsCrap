class IonSource {

  int z;
  float speed, current;
  
  static final int minZ = 22, maxZ = 79;
  static final float minSpeed = 1.0e4, maxSpeed = 1.0e6;
  static final float minI = 1.0e-9, maxI = 1.0e-2;
  
  IonSource() {
    z = (int) random(minZ, maxZ);
    speed = random(minSpeed, maxSpeed);
    current = random(minI, maxI);
  }
  
  int getAtomicNumber() {
    return z;
  }
  
  void setAtomicNumber(int zz) {
    if (minZ <= zz && zz <= maxZ) {
      z = zz;
    }
  }
  
  float getSpeed() {
    return speed;
  }
  
  void setSpeed(float v) {
    if (minSpeed <= v && v <= maxSpeed) {
      speed = v;
    }
  }
  
  float getCurrent() {
    return current;
  }
  
  void setCurrent(float i) {
    if (minI <= i && i <= maxI) {
      current = i;
    }
  }
  
}
