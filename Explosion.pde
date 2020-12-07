class Explosion extends GameObj {
  int t, r, g; // i can choose between red or green particles

  Explosion(float x, float y, int r, int g) {
    loc = new PVector (x, y);
    vel = new PVector(random(3, 5), 0);
    vel.rotate(random(360));
    lives=1;
    size=4;
    t=400;
    this.r = r;
    this.g = g;
  }
  void show() {
    noStroke();
    fill(r, g, 0, t);
    rect(loc.x, loc.y, size, size);
  }
  void act() {
    super.act();
    offScreen();
    t-=50;
  }
}
