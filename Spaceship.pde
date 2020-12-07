class Spaceship extends GameObj {
  PVector dir;
  int shotTimer, invincTimer, threshold, flash;


  Spaceship() {
    loc = new PVector(width/2, height/2);
    dir = new PVector(0.5, 0); //rise and run
    vel = new PVector(0, 0); //no mvment 
    size = 10;
    lives = 3;
    shotTimer = threshold = 20;
    invinc = true;
    invincTimer = 50;
    flash = 0;
  }
  void show() {
    pushMatrix(); 
    strokeWeight(2);
    stroke(theme.y);
    if (!invinc) fill(theme.x);
    else fill(theme.y);
    translate(loc.x, loc.y); //origin of rec
    rotate(dir.heading());
    triangle(size*4, 0, 5, -size, 5, size); 
    popMatrix();
  }
  void act() {
    super.act();
    shotTimer++;
    flash++;
    if (flash>60) flash=0;

    if (vel.mag() > 5 ) vel.setMag(5);

    if (akey) dir.rotate(radians(-3.5)); //anti
    if (dkey) dir.rotate(radians(3.5)); //clockwise
    if (wkey) {
      for (int i=0; i<random(5, 20); i++) myObj.add(new Particle());
      vel.add(dir);
      vel.mult(0.95);
    }
    if (skey) vel.sub(dir); //(vel.x >0 || vel.y >0)
    if (spacebar && shotTimer>threshold) {
      myObj.add(new Bullet()); 
      shotTimer = 0;
    }

    if (loc.x>width-size+1 || loc.x<size+1)  vel.x*=-1;  //BOUNCE
    if (loc.y>height-size+1 || loc.y<size+1)  vel.y*=-1;

    if (invinc) {
      invincTimer++;
      if (flash<30) newText("BOOST: invincible!", width-120, 20, 18, theme.y);
      else {
        fill(0, 255, 0);
        textSize(18);
        text("BOOST: invincible!", width-120, 20);
      }
    }
    
    if (threshold != 20) {
      if (flash<30) newText("BOOST: shoots faster!", width-120, 40, 18, theme.y);
      else {
        fill(0, 255, 0);
        textSize(18);
        text("BOOST: shoots faster!", width-120, 40);
      }
    }

    if (invincTimer==100) {
      invinc = false;
      invincTimer = 0;
    }


    int i = 0; 
    while (i<myObj.size()) {
      GameObj obj = myObj.get(i);
      if (obj instanceof PowerUp) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) {
          obj.lives--;
          timer = 0;
          threshold = 5;
        }
      } else if (obj instanceof Asteroid || obj instanceof Ufo || obj instanceof Bullet && obj.isUFO) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) {
          if (!invinc) lives--;
          if (!obj.invinc) obj.lives--;
          invinc = true;
          if (!obj.invinc && !obj.isUFO) {
            score++;
            if (obj.size > 30 && obj instanceof Asteroid) {
              myObj.add(new Asteroid((int)obj.size/2, loc.x, loc.y));
              myObj.add(new Asteroid((int)obj.size/2, loc.x, loc.y));
            }
            for (int j=0; j<random(20, 50); j++) myObj.add(new Explosion(loc.x, loc.y, 255, 0));
            obj.invinc = true;
          }
        }
      }
      i++;
    }
    if (myShip.lives<=0) mode = GAMEOVER;
  }
}
