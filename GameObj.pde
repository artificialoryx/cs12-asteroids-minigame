class GameObj {
  PVector loc;
  PVector vel;
  float size;
  int lives;
  boolean isUFO, invinc;

  GameObj() {
//        isUFO=invinc=false;
  }

  void show() {
    strokeWeight(3);
    stroke(theme.y);
    rect(loc.x, loc.y, size, size);
  }

  void act() {
    loc.add(vel);
  }

  void offScreen() {
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) lives--;
  }
}
