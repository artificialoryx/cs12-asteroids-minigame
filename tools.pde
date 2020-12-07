void keyPressed() {
  if (mode == GAME) {
    if (key=='w' || key=='W') wkey=true;
    if (key=='a' || key=='A') akey=true;
    if (key=='s' || key=='S') skey=true;
    if (key=='d' || key=='D') dkey=true;
    if (key==' ') spacebar = true;
    if (key=='1' && mode == GAME) {
      mode = GAMEOVER;
      cheat = true;
    }
  }
}


void keyReleased() {
  if (key=='w' || key=='W') wkey=false;
  if (key=='a' || key=='A') akey=false;
  if (key=='s' || key=='S') skey=false;
  if (key=='d' || key=='D') dkey=false;
  if (key==' ') spacebar = false;
  if (key==' ' && mode == PAUSE) mode = GAME;
}

void mouseReleased() {
  if (mode == GAME) mode = PAUSE;
  if (onButton(400, 400, 100, 50) && mode == INTRO) mode = GAME;
  if (onButton(400, 400, 100, 50) && mode == GAMEOVER) mode = INTRO;
  if (onButton(40, 80, 60, 20) && mode == GAME) mode = PAUSE;

  if (onButton(325, 450, 100, 30) && mode == INTRO) {
    theme = light.copy();
  }
  if (onButton(475, 450, 100, 30) && mode == INTRO) {
    theme = dark.copy();
  }
}

void button(int x, int y, int w, int h, int textSize, String label) {
  if (onButton(x, y, w, h)) { //hover
    strokeWeight(4);
    stroke(theme.y);
  } else {
    strokeWeight(1);
    stroke(theme.y);
  }
  fill(theme.x); 
  rect(x, y, w, h);
  fill(theme.y);
  textSize(textSize);
  text(label, x, y); //text, xy
}

void newText(String txt, float x, float y, int size, float col) {
  fill(col);
  textSize(size);
  text(txt, x, y);
}

boolean onButton(int x, int y, int w, int h) {
  if ( mouseX>x-w/2 && mouseX<x+w/2 && mouseY<y+h/2 && mouseY>y-h/2) return true;
  return false;
}
