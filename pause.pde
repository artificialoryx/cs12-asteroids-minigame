void pause() {

  fill(theme.x, 2);
  noStroke();
  rect(width/2, height/2, width, height);

  fill(theme.x);
  strokeWeight(4);
  stroke(theme.y);
  rect(width/2, height/2, 300, 125);

  newText("PAUSED", width/2, 275, 20, theme.y);
  newText("press SPACE to resume", width/2, 315, 20, theme.y);
}
