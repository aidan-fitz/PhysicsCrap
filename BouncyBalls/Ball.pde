class Ball {

  float radius;
  PVector pos, vel;
  color c;

  Ball() {
    this(0, 0);
    setRandomPosition();
  }

  Ball(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(1, 5));
    radius = random(10, 30);
    c = randomColor();
  }

  Ball(ArrayList<Ball> ballsack) {
    this(0, 0);
    setRandomPosition(ballsack);
  }

  void setRandomPosition(ArrayList<Ball> ballsack) {
    while (true) {
      setRandomPosition();

      boolean overlapsAnother = false;
      for (Ball b : ballsack) {
        if (overlaps(b)) {
          overlapsAnother = true;
          break;
        }
      }
      if (!overlapsAnother) return;
    }
  }

  void setRandomPosition() {
    pos.set(random(radius, width - radius), random(radius, height - radius));
  }

  void draw() {
    ellipseMode(RADIUS);
    fill(c);
    ellipse(pos.x, pos.y, radius, radius);
  }

  void move() {
    pos.add(vel);
    // bounce
    if (pos.x < radius || pos.x >= width - radius) {
      vel.x = -vel.x;
    }
    if (pos.y < radius || pos.y >= height - radius) {
      vel.y = -vel.y;
    }
  }

  // Formula from https://en.wikipedia.org/wiki/Elastic_collision#Two-Dimensional_Collision_With_Two_Moving_Objects
  void collide(Ball b) {
    // cache their masses
    float m1 = this.mass(), m2 = b.mass();
    PVector disp = displacement(b);
    // dot product of difference between velocities and displacement
    float yolo = PVector.sub(this.vel, b.vel).dot(disp);
    float distSq = disp.magSq();

    // v1' = v1 - m2 * 2/(m1 + m2) * yolo / distSq * disp
    // v2' = v2 + m1 * 2/(m1 + m2) * yolo / distSq * disp
    float swag = 2 * yolo / (distSq * (m1 + m2));

    this.vel.sub(PVector.mult(disp, m2 * swag));
    b.vel.add(PVector.mult(disp, m1 * swag));
  }

  // Area of circle times a constant
  float mass() {
    return radius * radius * 0.1;
  }

  boolean overlaps(Ball b) {
    return this != b && displacement(b).mag() <= this.radius + b.radius;
  }

  PVector displacement(Ball b) {
    return PVector.sub(this.pos, b.pos);
  }
}

