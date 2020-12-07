class PowerUp extends GameObj {

  PowerUp() {
    loc = new PVector (random(50, width-50), random(50, height-50));
    lives = 1;
    size = 20;
  }

  void show() {
    noStroke();
    fill(0, 255, 0);
    rect(loc.x, loc.y, size, size);
  }

  void act() {
  }
}
