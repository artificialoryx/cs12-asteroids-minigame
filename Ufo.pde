class Ufo extends GameObj {
  int flashTimer, shotTimer, spawnLoc;

  Ufo() {
    spawnLoc = (int)random(4); //spawns UFO from random side of screen
    switch(spawnLoc) { 
    case 0: 
      {
        loc = new PVector(-size, random(50, height-50));
        vel = new PVector(random(0.5, 1), 0); 
        break;
      }
    case 1:
      {
        loc = new PVector(width+size, random(50, height-50));
        vel = new PVector(random(-1, -0.5), 0); 
        break;
      }
    case 2: 
      {
        loc = new PVector(random(50, width-50), -size);
        vel = new PVector(0, random(0.5, 1)); 
        break;
      }
    case 3: 
      {
        loc = new PVector(random(50, width-50), height-size);
        vel = new PVector(0, random(-1, -0.5)); 
        break;
      }
    }

    size = 40;
    lives = 2;
    shotTimer=flashTimer = 0;
  }

  void show() {
    flashTimer++;
    shotTimer++;
    if (flashTimer>60) flashTimer=0;
    if (flashTimer<20) {
      fill(255, 0, 0);
    } else {
      fill(theme.x);
    }
    strokeWeight(2);
    stroke(255, 0, 0);
    ellipse(loc.x, loc.y, size, size);
    newText(String.valueOf(lives), loc.x, loc.y, 10, theme.x);
  }

  void act() {
    super.act();
    offScreen();

    if (shotTimer == 100) {
      myObj.add(new Bullet(new PVector(myShip.loc.x-loc.x, myShip.loc.y-loc.y), new PVector(loc.x, loc.y)));
      shotTimer=0;
    }

    int i = 0; 
    while (i<myObj.size()) {
      GameObj obj = myObj.get(i);
      if (obj instanceof Bullet && !obj.isUFO) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) {
          size-=10;
          if (lives == 1) {
            score+=3;
            for (int j=0; j<random(10, 20); j++) myObj.add(new Explosion(loc.x, loc.y, 0, 255));
          }
          lives -=1;
          obj.lives -=1;
        }
      }
      i++;
    }
  }
}
