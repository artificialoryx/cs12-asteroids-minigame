void gameOver() {
    
  background(theme.x);
  button(400, 400, 100, 50, 20, "OK");
  if (!cheat) newText("your score: "+score+" <3", width/2, 310, 15, theme.y);
  else newText("(but not really bc u just pressed 1)", width/2, 310, 15, theme.y);

  
  timer++;
  if (timer>60) timer=0;

  if (myShip.lives < 1) {
    if (timer<30) newText("YOU DIED :(", width/2, 250, 60, theme.y);
    else {
      fill(255, 0, 0);
      textSize(60);
      text("YOU DIED :(", width/2, 250);
    }
  } else {
    if (timer<30) newText("YOU WON!!", width/2, 250, 60, theme.y);
    else {
      fill(0, 255, 0);
      textSize(60);
      text("YOU WON!!", width/2, 250);
    }
  }
}
