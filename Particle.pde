class Particle extends GameObj {
  int t;
  Particle() {
    loc = myShip.loc.copy();
    vel = myShip.dir.copy();
    vel.rotate(radians(175+random(10)));
    vel.setMag(random(3, 5));
    lives=1;
    size=2;
    t = 400;
  }
  void show() {
    noStroke();
    fill(theme.y, t);
    rect(loc.x, loc.y, size, size);
  }
  void act() {
    super.act();
    offScreen();
    t-=50;
  }
}
