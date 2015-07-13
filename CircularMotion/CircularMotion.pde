PVector pos, vel;

void setup() {
  size(800, 600);
  pos = new PVector(width/2, height/2);
  vel = PVector.random2D();
}

void draw() {
  background(255);
  ellipse(pos.x, pos.y, 50, 50);
  pos.add(vel);
  
  vel.add(new PVector(-vel.y*0.01, vel.x*0.01));
}
