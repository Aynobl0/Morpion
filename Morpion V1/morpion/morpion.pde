int emplacement[] = new int[9]; //etat des cases
int win;        //0=pas encore gagné, 1=bleu 2=rouge
boolean turn;      //tour 0 = bleu    tour 1 = rouge
boolean begin;      //commencé ou non
boolean load;
PImage background;
PFont font;

void setup() {                                                                                //Setup
  font = loadFont("Caladea-Bold-48.vlw");
  textFont(font, 16);
  for (int i = 0; i < 9; i++) {                                                      //Variables (reset)
    emplacement[i]=0;
  }
  load=true;
  win=0;
  turn=false;
  begin=false;
  size(300, 300);
  background(255);
  rectMode(CENTER);
  frameRate(120);
  background=loadImage("https://www.mediafire.com/convkey/c1a9/3j8st2em05y47buzg.jpg");
}

void draw() {                                                                                        //Draw
  if (!begin) {                                                                                    //Boutton commencement
    if(load) {
      cursor(WAIT);
      image(background, -width, -height, width*4, height*4);
      load=false;
    }
    rectMode(CENTER);
    fill(0);
    rect(152, 152, 150, 30);
    fill(100);
    rect(150, 150, 150, 30);
    fill(0);
    stroke(2);
    text("COMMENCER?", 100, 156);
    fill(255);
    text("COMMENCER?", 99, 155);
    fill(230);
    stroke(1);
    if (mouseX>75 && mouseX<225 && mouseY>125 && mouseY<175) {                                                //Boutton commencement - Crosshair
      cursor(HAND);
    } else {
      cursor(CROSS);
    }
  }

  if (begin) {                                                                                                //Crosshair global
    if (win==0) {
      if (mouseX>25 && mouseX<75 && mouseY>25 && mouseY<75) {
        if (emplacement[0]==0) {
          cursor(HAND);
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>25 && mouseY<75) {
        if (emplacement[1]==0) {
          cursor(HAND);
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>25 && mouseY<75) {
        if (emplacement[2]==0) {
          cursor(HAND);
        }
      } else if (mouseX>25 && mouseX<75 && mouseY>125 && mouseY<175) {
        if (emplacement[3]==0) {
          cursor(HAND);
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>125 && mouseY<175) {
        if (emplacement[4]==0) {
          cursor(HAND);
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>125 && mouseY<175) {
        if (emplacement[5]==0) {
          cursor(HAND);
        }
      } else if (mouseX>25 && mouseX<75 && mouseY>225 && mouseY<275) {
        if (emplacement[6]==0) {
          cursor(HAND);
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>225 && mouseY<275) {
        if (emplacement[7]==0) {
          cursor(HAND);
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>225 && mouseY<275) {
        if (emplacement[8]==0) {
          cursor(HAND);
        }
      } else {
          cursor(CROSS);
      }
    } else {
      cursor(CROSS);
    }
  }

  if (win==0) {                                                                                                       //Jeu- verif win
    if (emplacement[0]==1 && emplacement[1]==1 && emplacement[2]==1) {
      win=1;
      winLine(0,win);
    } else if (emplacement[0]==2 && emplacement[1]==2 && emplacement[2]==2) {
      win=2;
      winLine(0,win);
    } else if (emplacement[3]==1 && emplacement[4]==1 && emplacement[5]==1) {
      win=1;
      winLine(1,win);
    } else if (emplacement[3]==2 && emplacement[4]==2 && emplacement[5]==2) {
      win=2;
      winLine(1,win);
    } else if (emplacement[6]==1 && emplacement[7]==1 && emplacement[8]==1) {
      win=1;
      winLine(2,win);
    } else if (emplacement[6]==2 && emplacement[7]==2 && emplacement[8]==2) {
      win=2;
      winLine(2,win);
    } else if (emplacement[0]==1 && emplacement[3]==1 && emplacement[6]==1) {
      win=1;
      winColumn(0,win);
    } else if (emplacement[0]==2 && emplacement[3]==2 && emplacement[6]==2) {
      win=2;
      winColumn(0,win);
    } else if (emplacement[1]==1 && emplacement[4]==1 && emplacement[7]==1) {
      win=1;
      winColumn(1,win);
    } else if (emplacement[1]==2 && emplacement[4]==2 && emplacement[7]==2) {
      win=2;
      winColumn(1,win);
    } else if (emplacement[2]==1 && emplacement[5]==1 && emplacement[8]==1) {
      win=1;
      winColumn(2,win);
    } else if (emplacement[2]==2 && emplacement[5]==2 && emplacement[8]==2) {
      win=2;
      winColumn(2,win);
    } else if (emplacement[0]==1 && emplacement[4]==1 && emplacement[8]==1) {
      win=1;
      winLeftToRight(win);
    } else if (emplacement[0]==2 && emplacement[4]==2 && emplacement[8]==2) {
      win=2;
      winLeftToRight(win);
    } else if (emplacement[2]==1 && emplacement[4]==1 && emplacement[6]==1) {
      win=1;
      winRightToLeft(win);
    } else if (emplacement[2]==2 && emplacement[4]==2 && emplacement[6]==2) {
      win=2;
      winRightToLeft(win);
    }
    if (emplacement[0]>0 && emplacement[1]>0 && emplacement[2]>0 && emplacement[3]>0 && emplacement[4]>0 && emplacement[5]>0 && emplacement[6]>0 && emplacement[7]>0 && emplacement[8]>0 && win==0) {
      win=3;
    }
    if (win!=0) {
      gameEnd(win);
    }
  }
}

void mousePressed() {                                                                                         //mousePressed
  if (!begin) {                                                                                    //Quadrillage - Carré de placement
    if (mouseX>75 && mouseX<225 && mouseY>125 && mouseY<175) {
      begin=true;
      cursor(WAIT);
      image(background, -width, -height, width*4, height*4);
      stroke(4);
      line(0, 100, 300, 100);  //Quadrillage
      line(0, 200, 300, 200);
      line(100, 0, 100, 300);
      line(200, 0, 200, 300);
    }
    return;
  }

  if (begin) {                                                                                       //jeu - placement pion
    if (win==0) {
      noStroke();
      if (mouseX>15 && mouseX<95 && mouseY>15 && mouseY<95) {
        if (!turn) {
          if (emplacement[0]==0) {
            emplacement[0]=1;
            blueCross(1,1);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[0]==0) {
            emplacement[0]=2;
            redRound(1,1);
            turn=!turn;
          }
        }
      } else if (mouseX>115 && mouseX<195 && mouseY>15 && mouseY<95) {
        if (!turn) {
            if (emplacement[1]==0) {
              emplacement[1]=1;
              blueCross(2,1);
              turn=!turn;
            }
          }
          if (turn) {
            if (emplacement[1]==0) {
              emplacement[1]=2;
              redRound(2,1);
              turn=!turn;
            }
          }
      } else if (mouseX>215 && mouseX<295 && mouseY>15 && mouseY<95) {
        if (!turn) {
          if (emplacement[2]==0) {
            emplacement[2]=1;
            blueCross(3,1);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[2]==0) {
            emplacement[2]=2;
            redRound(3,1);
            turn=!turn;
          }
        }
      } else if (mouseX>15 && mouseX<95 && mouseY>115 && mouseY<195) {
        if (!turn) {
          if (emplacement[3]==0) {
            emplacement[3]=1;
            blueCross(1,2);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[3]==0) {
            emplacement[3]=2;
            redRound(1,2);
            turn=!turn;
          }
        }
      } else if (mouseX>115 && mouseX<195 && mouseY>115 && mouseY<195) {
        if (!turn) {
          if (emplacement[4]==0) {
            emplacement[4]=1;
            blueCross(2,2);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[4]==0) {
            emplacement[4]=2;
            redRound(2,2);
            turn=!turn;
          }
        }
      } else if (mouseX>215 && mouseX<295 && mouseY>115 && mouseY<195) {
        if (!turn) {
          if (emplacement[5]==0) {
            emplacement[5]=1;
            blueCross(3,2);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[5]==0) {
            emplacement[5]=2;
            redRound(3,2);
            turn=!turn;
          }
        }
      } else if (mouseX>15 && mouseX<95 && mouseY>215 && mouseY<295) {
        if (!turn) {
          if (emplacement[6]==0) {
            emplacement[6]=1;
            blueCross(1,3);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[6]==0) {
            emplacement[6]=2;
            redRound(1,3);
            turn=!turn;
          }
        }
      } else if (mouseX>115 && mouseX<195 && mouseY>215 && mouseY<295) {
        if (!turn) {
          if (emplacement[7]==0) {
            emplacement[7]=1;
            blueCross(2,3);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[7]==0) {
            emplacement[7]=2;
            redRound(2,3);
            turn=!turn;
          }
        }
      } else if (mouseX>215 && mouseX<295 && mouseY>215 && mouseY<295) {
        if (!turn) {
          if (emplacement[8]==0) {
            emplacement[8]=1;
            blueCross(3,3);
            turn=!turn;
          }
        }
        if (turn) {
          if (emplacement[8]==0) {
            emplacement[8]=2;
            redRound(3,3);
            turn=!turn;
          }
        }
      }
    } else {
      load=true;
      setup();
    }
  }
}
