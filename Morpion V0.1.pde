float colorR;
float colorV;
float colorB;
int case1=0;
int case2=0;
int case3=0;
int case4=0;
int case5=0;
int case6=0;
int case7=0;
int case8=0;
int case9=0;
int case1p=0;
int case2p=0;
int case3p=0;
int case4p=0;
int case5p=0;
int case6p=0;
int case7p=0;
int case8p=0;
int case9p=0;
int win=0;
int turnB=1;
int turnR=0;
int begin=0;
int rs5=0;

void setup() {
  size(300, 300);
  background(255);
  rectMode(CENTER);
  frameRate(30);
}


void draw() {

  if (begin==0) {
    rectMode(CENTER);
    fill(0);
    rect(152, 152, 150, 50);
    fill(100);
    rect(150, 150, 150, 50);
    fill(0);
    stroke(2);
    text("COMMENCER?", 106, 146);
    fill(255);
    text("COMMENCER?", 105, 145);
    fill(230);
    text("Clique droit= Rouge.", 97, 170);
    text("Clique gauche= Bleu.", 94, 160);
    stroke(1);
  }

  if (begin==0) {
    if (mouseX>75 && mouseX<225 && mouseY>125 && mouseY<175) {
      cursor(HAND);
    } else {
      cursor(CROSS);
    }
  }

  if (begin>=1) {
    if (win==0) {
      if (mouseX>25 && mouseX<75 && mouseY>25 && mouseY<75) {
        if (case1p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>25 && mouseY<75) {
        if (case2p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>25 && mouseY<75) {
        if (case3p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>25 && mouseX<75 && mouseY>125 && mouseY<175) {
        if (case4p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>125 && mouseY<175) {
        if (case5p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>125 && mouseY<175) {
        if (case6p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>25 && mouseX<75 && mouseY>225 && mouseY<275) {
        if (case7p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>225 && mouseY<275) {
        if (case8p!=1) {
          cursor(HAND);
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>225 && mouseY<275) {
        if (case9p!=1) {
          cursor(HAND);
        }
      } else {
        cursor(CROSS);
      }
    } else {
      cursor(CROSS);
    }
  }



  if (win>0) {
    if (win==1) {
      stroke(1);
      fill(0);
      rect(151,111,175,30);
      fill(255);
      rect(150,110,175,30);
      fill(0, 102, 204);
      text("L'EQUIPE BLEUE A GAGNE!", 70, 115);
    } else if (win==2) {
      stroke(1);
      fill(0);
      rect(151,111,175,30);
      fill(255);
      rect(150,110,175,30);
      fill(204, 102, 0);
      noStroke();
      text("L'EQUIPE ROUGE A GAGNE!", 70, 115);
    }
  }


  if (win==0) {
    if (case1==1 && case2==1 && case3==1) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 20, 260, 60);
      rectMode(CENTER);
      win=1;
    } else if (case1==2 && case2==2 && case3==2) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 20, 260, 60);
      rectMode(CENTER);
      win=2;
    } else if (case4==1 && case5==1 && case6==1) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 120, 260, 60);
      rectMode(CENTER);
      win=1;
    } else if (case4==2 && case5==2 && case6==2) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 120, 260, 60);
      rectMode(CENTER);
      win=2;
    } else if (case7==1 && case8==1 && case9==1) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 220, 260, 60);
      rectMode(CENTER);
      win=1;
    } else if (case7==2 && case8==2 && case9==2) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 220, 260, 60);
      rectMode(CENTER);
      win=2;
    } else if (case1==1 && case4==1 && case7==1) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 20, 60, 260);
      rectMode(CENTER);
      win=1;
    } else if (case1==2 && case4==2 && case7==2) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(20, 20, 60, 260);
      rectMode(CENTER);
      win=2;
    } else if (case2==1 && case5==1 && case8==1) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(120, 20, 60, 260);
      rectMode(CENTER);
      win=1;
    } else if (case2==2 && case5==2 && case8==2) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(120, 20, 60, 260);
      rectMode(CENTER);
      win=2;
    } else if (case3==1 && case6==1 && case9==1) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(220, 20, 60, 260);
      rectMode(CENTER);
      win=1;
    } else if (case3==2 && case6==2 && case9==2) {
      rectMode(CORNER);
      stroke(2);
      noFill();
      rect(220, 20, 60, 260);
      rectMode(CENTER);
      win=2;
    } else if (case1==1 && case5==1 && case9==1) {
      stroke(2);
      noFill();
      beginShape();
      vertex(20, 60);
      vertex(20, 20);
      vertex(60, 20);
      vertex(280, 240);
      vertex(280, 280);
      vertex(240, 280);
      endShape(CLOSE);
      win=1;
    } else if (case1==2 && case5==2 && case9==2) {
      stroke(2);
      noFill();
      beginShape();
      vertex(20, 60);
      vertex(20, 20);
      vertex(60, 20);
      vertex(280, 240);
      vertex(280, 280);
      vertex(240, 280);
      endShape(CLOSE);
      win=2;
    } else if (case3==1 && case5==1 && case7==1) {
      stroke(2);
      noFill();
      beginShape();
      vertex(60, 280);
      vertex(20, 280);
      vertex(20, 240);
      vertex(240, 20);
      vertex(280, 20);
      vertex(280, 60);
      endShape(CLOSE);
      win=1;
    } else if (case3==2 && case5==2 && case7==2) {
      stroke(2);
      noFill();
      beginShape();
      vertex(60, 280);
      vertex(20, 280);
      vertex(20, 240);
      vertex(240, 20);
      vertex(280, 20);
      vertex(280, 60);
      endShape(CLOSE);
      win=2;
    } else {
    }
    if (case1>0 && case2>0 && case3>0 && case4>0 && case5>0 && case6>0 && case7>0 && case8>0 && case9>0) {
      stroke(1);
      fill(0);
      rect(151,111,175,30);
      fill(255);
      rect(150,110,175,30);
      fill(204, 102, 0);
      noStroke();
      text("EGALITE!", 122, 115);
    }
  }
  
if (rs5==1) {
  case5p=0;
  case5=0;
  rs5++;
  turnB=1;
  turnR=0;
  fill(255);
  rectMode(CENTER);
  noStroke();
  rect(150,150,80,80);
  fill(150);
  stroke(1);
  rect(150, 150, 25, 25);
}
}



void mousePressed() {

  if (begin==0) {
    if (mouseX>75 && mouseX<225 && mouseY>125 && mouseY<175) {
      begin++;
    background(255);
    line(0, 100, 300, 100);  //Quadrillage
    line(0, 200, 300, 200);
    line(100, 0, 100, 300);
    line(200, 0, 200, 300);
    fill(150);            //Carrés de placement
    rect(50, 50, 25, 25);
    rect(150, 50, 25, 25);
    rect(250, 50, 25, 25);
    rect(50, 150, 25, 25);
    rect(150, 150, 25, 25);
    rect(250, 150, 25, 25);
    rect(50, 250, 25, 25);
    rect(150, 250, 25, 25);
    rect(250, 250, 25, 25);
    }
  }


  if (begin>0) {
    if (rs5==0) {
      rs5=1;
    }
    if (win==0) {
      if (mouseX>25 && mouseX<75 && mouseY>25 && mouseY<75) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case1p!=1) {
              case1p=1;
              case1=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(50, 50, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case1p!=1) {
              case1p=1;
              case1=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(50, 50, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>25 && mouseY<75) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case2p!=1) {
              case2p=1;
              case2=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(150, 50, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case2p!=1) {
              case2p=1;
              case2=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(150, 50, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>25 && mouseY<75) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case3p!=1) {
              case3p=1;
              case3=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(250, 50, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case3p!=1) {
              case3p=1;
              case3=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(250, 50, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>25 && mouseX<75 && mouseY>125 && mouseY<175) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case4p!=1) {
              case4p=1;
              case4=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(50, 150, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case4p!=1) {
              case4p=1;
              case4=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(50, 150, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>125 && mouseY<175) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case5p!=1) {
              case5p=1;
              case5=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(150, 150, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case5p!=1) {
              case5p=1;
              case5=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(150, 150, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>125 && mouseY<175) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case6p!=1) {
              case6p=1;
              case6=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(250, 150, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case6p!=1) {
              case6p=1;
              case6=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(250, 150, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>25 && mouseX<75 && mouseY>225 && mouseY<275) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case7p!=1) {
              case7p=1;
              case7=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(50, 250, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case7p!=1) {
              case7p=1;
              case7=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(50, 250, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>125 && mouseX<175 && mouseY>225 && mouseY<275) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case8p!=1) {
              case8p=1;
              case8=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(150, 250, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case8p!=1) {
              case8p=1;
              case8=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(150, 250, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      } else if (mouseX>225 && mouseX<275 && mouseY>225 && mouseY<275) {
        if (mouseButton == LEFT) {
          if (turnB==1) {
            if (case9p!=1) {
              case9p=1;
              case9=1;
              colorR=0;
              colorV=102;
              colorB=255;
              fill(colorR, colorV, colorB);
              ellipse(250, 250, 50, 50);
              turnB--;
              turnR++;
            }
          }
        } else if (mouseButton == RIGHT) {
          if (turnR==1) {
            if (case9p!=1) {
              case9p=1;
              case9=2;
              colorR=255;
              colorV=0;
              colorB=51;
              fill(colorR, colorV, colorB);
              ellipse(250, 250, 50, 50);
              turnB++;
              turnR--;
            }
          }
        }
      }
    }
  }
}