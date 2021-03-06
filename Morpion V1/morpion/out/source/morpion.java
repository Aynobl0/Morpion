import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class morpion extends PApplet {

int emplacement[] = new int[9]; //etat des cases
int win;        //0=pas encore gagné, 1=bleu 2=rouge
boolean turn;      //tour 0 = bleu    tour 1 = rouge
boolean begin;      //commencé ou non
boolean load;
PImage background;
PFont font;

public void setup() {                                                                                //Setup        
  font = loadFont("Caladea-Bold-48.vlw");
  textFont(font, 16);
  for (int i = 0; i < 9; i++) {                                                      //Variables (reset)
    emplacement[i]=0;
  }
  load=true;
  win=0;
  turn=false;
  begin=false;
  
  background(255);
  rectMode(CENTER);
  frameRate(120);
  background=loadImage("https://www.mediafire.com/convkey/c1a9/3j8st2em05y47buzg.jpg");
}

public void draw() {                                                                                        //Draw
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

public void mousePressed() {                                                                                         //mousePressed
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
//Affichage des 3 pionts gagnants.
public short winLine(int line,int win) {
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

public short winColumn(int column,int win) {
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

public short winLeftToRight(int win) { //Gain du haut gauche au bas droit
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
  line(78.5f,21.5f,278.5f,221.5f);
  line(21.5f,78.5f,221.5f,278.5f);
  arc(50, 50, 80, 80, 3*PI/4, 7*PI/4);
  arc(250, 250, 80, 80, -PI/4, 3*PI/4);
  stroke(0);
  return 0;
}

public short winRightToLeft(int win) { //Gain du haut droit au bas gauche
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
  line(221.5f,21.5f,21.5f,221.5f);
  line(78.5f,278.5f,278.5f,78.5f);
  arc(250, 50, 80, 80, -3*PI/4, PI/4);
  arc(50, 250, 80, 80, PI/4, 5*PI/4);
  stroke(0);
  return 0;
}

public short redRound(int placementX,int placementY) {
  fill(240, 30, 30);
  ellipse(50+100*(placementX-1), 50+100*(placementY-1), 50, 50);
  return 0;
}

public short blueCross(int placementX,int placementY) {
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

public short gameEnd(int win) {
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
  public void settings() {  size(300, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "morpion" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
