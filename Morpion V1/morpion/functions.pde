//Affichage des 3 pionts gagnants.
short winLine(int line,int win) {
  rectMode(CORNER);
  stroke(2);
  noFill();
  switch (win) {
    case 2 :
      stroke(240, 30, 30);
    break;	
    case 1 :
      stroke(30, 30, 240);
    break;	
  }
  line(50,10+100*line,250,10+100*line);
  line(50,90+100*line,250,90+100*line);
  arc(50, 50+100*line, 80, 80, PI/2, (3*PI)/2);
  arc(250, 50+100*line, 80, 80, -PI/2, PI/2);
  rectMode(CENTER);
  stroke(0);
  return 0;
}

short winColumn(int column,int win) {
  rectMode(CORNER);
  stroke(2);
  noFill();
  switch (win) {
    case 2 :
      stroke(240, 30, 30);
    break;
    case 1 :
      stroke(30, 30, 240);
    break;
  }
  line(10+100*column,50,10+100*column,250);
  line(90+100*column,50,90+100*column,250);
  arc(50+100*column, 50, 80, 80, PI, 2*PI);
  arc(50+100*column, 250, 80, 80, 0, PI);
  rectMode(CENTER);
  stroke(0);
  return 0;
}

short winLeftToRight(int win) { //Gain du haut gauche au bas droit
  stroke(2);
  noFill();
  switch (win) {
    case 2 :
      stroke(240, 30, 30);
    break;
    case 1 :
      stroke(30, 30, 240);
    break;
  }
  line(78.5,21.5,278.5,221.5);
  line(21.5,78.5,221.5,278.5);
  arc(50, 50, 80, 80, 3*PI/4, 7*PI/4);
  arc(250, 250, 80, 80, -PI/4, 3*PI/4);
  stroke(0);
  return 0;
}

short winRightToLeft(int win) { //Gain du haut droit au bas gauche
  stroke(2);
  noFill();
  switch (win) {
    case 2 :
      stroke(240, 30, 30);
    break;	
    case 1 :
      stroke(30, 30, 240);
    break;	
  }
  line(221.5,21.5,21.5,221.5);
  line(78.5,278.5,278.5,78.5);
  arc(250, 50, 80, 80, -3*PI/4, PI/4);
  arc(50, 250, 80, 80, PI/4, 5*PI/4);
  stroke(0);
  return 0;
}

short redRound(int placementX,int placementY) {
  fill(240, 30, 30);
  ellipse(50+100*(placementX-1), 50+100*(placementY-1), 50, 50);
  return 0;
}

short blueCross(int placementX,int placementY) {
  int x=100*(placementX-1),y=100*(placementY-1);
  fill(30, 30, 240);
  beginShape(); //Croix
    vertex(30+x,25+y);
    vertex(50+x,45+y);
    vertex(70+x,25+y);
    vertex(75+x,30+y);
    vertex(55+x,50+y);
    vertex(75+x,70+y);
    vertex(70+x,75+y);
    vertex(50+x,55+y);
    vertex(30+x,75+y);
    vertex(25+x,70+y);
    vertex(45+x,50+y);
    vertex(25+x,30+y);
  endShape(CLOSE);
  return 0;
}

short gameEnd(int win) {
  switch (win) {
    case 1 :
      stroke(1);
      fill(0);    
      rect(151,111,225,30);
      fill(255);
      rect(150,110,225,30);
      stroke(2);
      fill(0);
      text("L'EQUIPE BLEUE A GAGNE!", 51, 116);
      fill(0, 102, 204);
      text("L'EQUIPE BLEUE A GAGNE!", 50, 115);
    break;	
    case 2 :
      stroke(1);
      fill(0);
      rect(151,111,225,30);
      fill(255);
      rect(150,110,225,30);
      stroke(2);
      fill(0);
      text("L'EQUIPE ROUGE A GAGNE!", 51, 116);
      fill(204, 102, 0);
      text("L'EQUIPE ROUGE A GAGNE!", 50, 115);
    break;	
    case 3 :
      stroke(1);
      fill(0);
      rect(151,111,175,30);
      fill(255);
      rect(150,110,175,30);
      fill(204, 102, 0);
      noStroke();
      text("EGALITE!", 117, 115);
    break;	
  }
  return 0;
}
