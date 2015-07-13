int cx = 50, cy = 50;

float angle = 0;
int radius = 40;

void setup() {
  size(100, 100);
}

void draw() {
  background(0);
  // Draw the Sun
  fill(#FFFF33);
  stroke(#FFCC00);
  strokeWeight(2);
  ellipse(cx, cy, 25, 25);
  // Draw Earth
  fill(#00CCFF);
  stroke(#FFFFFF);
  strokeWeight(1);
  ellipse(cx + radius*cos(angle), cy + radius*sin(angle), 5, 5);
  // Increment angle
  angle += 0.02;
  angle %= 360;
}
