void intro() {
  setup();

  background(theme.x);
  button(400, 400, 100, 50, 20, "START");
  button(325, 450, 100, 30, 10, "LIGHT MODE");
  button(475, 450, 100, 30, 10, "DARK MODE");


  timer++;
  if (timer>60) timer=0;
  newText("ASTEROIDS", width/2, 250, 60, theme.y);
  if (timer<30) {
    textSize(60);
    fill(255, 0, 0);
    text("<3                         ", width/2, 250);
    fill(0, 255, 0);
    text("                         <3", width/2, 250);
  } else {
    textSize(60);
    fill(0, 255, 0);
    text("<3                         ", width/2, 250);
    fill(255, 0, 0);
    text("                         <3", width/2, 250);
  }
}
