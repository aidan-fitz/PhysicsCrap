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
  // Loop thru all balls
  for (int i = 0; i < ballsack.size(); i++) {
    Ball bi = ballsack.get(i);
    bi.draw();
    bi.move();
    // loop thru all balls that come after me
    // so no two balls collide twice
    for (int j = i + 1; j < ballsack.size(); j++) {
      Ball bj = ballsack.get(j);
      if (bi.overlaps(bj)) {
        bi.collide(bj);
      }
    }
  }
}

color randomColor() {
  float red = random(100, 255), 
  green = random(100, 255), 
  blue = random(100, 255);
  return color(red, green, blue);
}

