Spaceship myShip;
ArrayList<GameObj> myObj;
boolean wkey, akey, skey, dkey, spacebar, cheat;
int score, mode, timer, ufoSpawn;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
PVector dark = new PVector(0, 255);
PVector light = new PVector(255, 0); 
PVector theme = new PVector(0, 255); //i can choose colors by calling theme.x or theme.y



void setup() {
  size(800, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  wkey=akey=skey=dkey=cheat=false;
  myShip = new Spaceship();
  myObj = new ArrayList<GameObj>();
  for (int i=0; i<random(3, 7); i++) myObj.add(new Asteroid());
  mode=score=0;
  ufoSpawn = 700;

  myObj.add(new PowerUp());

}

void draw() { 
  
  switch(mode) { 
  case INTRO: 
    intro();
    break;
  case GAME: 
    game();
    break;
  case PAUSE: 
    pause();
    break;
  case GAMEOVER: 
    gameOver();
    break;
  default: 
    println("ERROR! MODE = "+mode);
  }
}
