class Bullet extends GameObj {
  
  Bullet() {
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    vel = new PVector(myShip.dir.x, myShip.dir.y);
    vel.setMag(10);
    size = 3;
    lives = 1;
  }

  Bullet(PVector aim, PVector loc) {
    this.vel = aim.copy();
    this.loc = loc.copy();
    vel.setMag(10);
    size = 3;
    lives = 1;
    isUFO = true;
  }

  void show() {
    super.show();
    strokeWeight(3);
    if (!isUFO) stroke(theme.y);
    else stroke(255, 0, 0);
    rect(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();
    offScreen();
  }
} 
