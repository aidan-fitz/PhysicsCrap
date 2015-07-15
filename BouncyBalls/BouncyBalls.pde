ArrayList<Ball> ballsack;

void setup() {
  size(1024, 768);
  ballsack = new ArrayList<Ball>();
  for (int i = 0; i < 50; i++) {
    ballsack.add(new Ball(ballsack));
  }
//  noLoop();
}

void draw() {
  background(192);
  for (Ball b : ballsack) {
    b.draw();
    b.move();
  }
}

color randomColor() {
  float red = random(100, 255), 
  green = random(100, 255), 
  blue = random(100, 255);
  return color(red, green, blue);
}

