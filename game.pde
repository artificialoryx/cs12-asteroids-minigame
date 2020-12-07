void game() {
  int counter = 0;
  ufoSpawn++;

  background(theme.x);
  stroke(255);
  fill(0);
  myShip.show();
  myShip.act(); 
  
  int i = 0;
  while (i<myObj.size()) {
    GameObj obj = myObj.get(i); //get obj
    if (obj.lives > 0) {
      obj.show();
      obj.act();
      if (obj instanceof Asteroid) counter++;
      i++;
    } else myObj.remove(i);
  }
  
if (counter<1) mode = GAMEOVER;

println(counter);

  
  if (ufoSpawn == 1000) {
    myObj.add(new Ufo());
    ufoSpawn = 0;
  }

  button(40, 30, 60, 20, 12, "Lives:"+String.valueOf(myShip.lives));
  button(40, 55, 60, 20, 12, "Score:"+score);
  newText("click anywhere to pause!", 80, 80, 12, theme.y);
  newText("click \"1\" to win <3", width/2, height-30, 12, theme.y);

  timer++;
  if (timer>500) {
    myObj.add(new PowerUp());
    timer=0;
  }

  if (myShip.threshold != 20 && timer%150 == 0) myShip.threshold = 20;
}
