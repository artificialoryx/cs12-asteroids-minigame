class Asteroid extends GameObj {
  int invincTimer;

  Asteroid() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(1, 0);
    vel.rotate(random(360)); 
    size = random(30, 70);
    lives = 1;
    invincTimer = 0;
    invinc = true;
  }
  Asteroid(int s, float x, float y) {  //for mini asteroids
    vel = new PVector(2, 0);
    vel.rotate(random(360));
    lives = 1;
    loc = new PVector(x, y);
    size = s;
    invincTimer = 0;
    invinc = true;
  }

  void show() {
    fill(theme.x);
    strokeWeight(2);
    stroke(255, 0, 0);
    ellipse(loc.x, loc.y, size, size);
  }
  void act() {
    super.act();
    
    if (invinc) invincTimer++;
    if (invincTimer==30) {
      invinc = false;
      invincTimer = 0;
    }
    
    int i = 0; 
    while (i<myObj.size()) {
      GameObj obj = myObj.get(i);
      if (obj instanceof Bullet && !obj.isUFO) {
        if (!invinc && dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) {
          score++;
          obj.lives = 0;
          lives = 0;
          if (size > 30) {
            myObj.add(new Asteroid((int)size/2, loc.x, loc.y));
            myObj.add(new Asteroid((int)size/2, loc.x, loc.y));
          }
          for (int j=0; j<random(10, 20); j++) myObj.add(new Explosion(loc.x, loc.y, 0, 255));
        }
      }
      i++;
    } 
    
    
    if (loc.x>width-size/2 || loc.x<size/2)  vel.x*=-1;  // bounces at side of screen
    if (loc.y>height-size/2 || loc.y<size/2)  vel.y*=-1;
  }
}
