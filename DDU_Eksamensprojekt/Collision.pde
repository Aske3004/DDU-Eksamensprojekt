//PVector player1Velocity = new PVector();
//PVector player1Position = new PVector(width/2+400, height+200);
//boolean player1CanJump = false;
//boolean player1IsJumping = false;

boolean player1A, player1D, player2A, player2D, player3A, player3D, jump;
boolean hasTouchedLava = false;
boolean hasCompletedCurrentLevel=false;

PVector gravity = new PVector(0, 0.5);

PVector contact_point = new PVector();
PVector contact_normal = new PVector();
float t_hit_near;

ArrayList<Rectangle> rectangles = new ArrayList();
PVector directionOfRay = new PVector();
LevelGenerator levelGenerator;

void runInDraw() {
  gameController.levelGenerator.drawTheLoadedMap();
  if (player1A) {
    player1Velocity.x=-5;
    rectangles.get(0).velocity.x=-5;
  }
  if (player1D) {
    player1Velocity.x=5;
    rectangles.get(0).velocity.x=5;
  }
  if (!player1A&&!player1D) {
    player1Velocity.x=0;
    rectangles.get(0).velocity.x=0;
  }
  if (amountOfPlayers==2) {
    if (player2A) {
      player2Velocity.x=-5;
      rectangles.get(1).velocity.x=-5;
    }
    if (player2D) {
      player2Velocity.x=5;
      rectangles.get(1).velocity.x=5;
    }
    if (!player2A&&!player2D) {
      player2Velocity.x=0;
      rectangles.get(1).velocity.x=0;
    }
  }
  if (amountOfPlayers==3) {
    if (player2A) {
      player2Velocity.x=-5;
      rectangles.get(1).velocity.x=-5;
    }
    if (player2D) {
      player2Velocity.x=5;
      rectangles.get(1).velocity.x=5;
    }
    if (!player2A&&!player2D) {
      player2Velocity.x=0;
      rectangles.get(1).velocity.x=0;
    }

    if (player3A) {
      player3Velocity.x=-5;
      rectangles.get(2).velocity.x=-5;
    }
    if (player3D) {
      player3Velocity.x=5;
      rectangles.get(2).velocity.x=5;
    }
    if (!player3A&&!player3D) {
      player3Velocity.x=0;
      rectangles.get(2).velocity.x=0;
    }
  }

  player1Velocity.y+=gravity.y;
  if (amountOfPlayers==2) {
    player2Velocity.y+=gravity.y;
    player2Position.x+=player2Velocity.x;
  }
  if (amountOfPlayers==3) {
    player2Velocity.y+=gravity.y;
    player2Position.x+=player2Velocity.x;

    player3Velocity.y+=gravity.y;
    player3Position.x+=player3Velocity.x;
  }


  for (int i = amountOfPlayers; i<rectangles.size(); i++) {
    if (DynamicRectVsRect(rectangles.get(0), rectangles.get(i))) {
      if (rectangles.get(i).type=="dangerTile") {
        //DET DER SKAL SKE HVIS LAVA ER BLEVET RØRT
        hasTouchedLava=true;
      }
      if (rectangles.get(i).type=="finishline") {
        //DET DER SKAL SKE HVIS FINISHLINE ER BLEVET RØRT
        hasCompletedCurrentLevel=true;
      }

      if (contact_normal.x==-1&&contact_normal.y==0) {
      }
      if (contact_normal.x==1&&contact_normal.y==0) {
      }
      if (contact_normal.y==-1&&contact_normal.x==0) {
        player1Velocity.y=0;
        player1CanJump=true;
        player1IsJumping=false;
      }
      if (contact_normal.y==1&&contact_normal.x==0) {
        player1Velocity.y=0;
      }
      PVector numericVelocity = new PVector(abs(rectangles.get(0).velocity.x), abs(rectangles.get(0).velocity.y));
      rectangles.get(0).velocity.x+=contact_normal.x*numericVelocity.x*(1-t_hit_near);
      rectangles.get(0).velocity.y+=contact_normal.y*numericVelocity.y*(1-t_hit_near);
    }
    if (amountOfPlayers==2) {
      if (DynamicRectVsRect(rectangles.get(1), rectangles.get(i))) {
        if (rectangles.get(i).type=="dangerTile") {
          //DET DER SKAL SKE HVIS LAVA ER BLEVET RØRT
          hasTouchedLava=true;
        }
        if (rectangles.get(i).type=="thornBush") {
          //DET DER SKAL SKE HVIS TORNEBUSK ER BLEVET RØRT
          hasTouchedLava=true;
        }
        if (rectangles.get(i).type=="finishline") {
          //DET DER SKAL SKE HVIS FINISHLINE ER BLEVET RØRT
          hasCompletedCurrentLevel=true;
        }

        if (contact_normal.x==-1&&contact_normal.y==0) {
          //println("COLLIDER MED VENSTRE SIDE");
          player2Position.x-=5;
        }
        if (contact_normal.x==1&&contact_normal.y==0) {
          player2Position.x+=5;
          //println("COLLIDER MED HØJRE SIDE");
        }
        if (contact_normal.y==-1&&contact_normal.x==0) {
          //println("COLLIDER MED ØVRE SIDE");
          player2Velocity.y=0;
          player2CanJump=true;
          player2IsJumping=false;
        }
        if (contact_normal.y==1&&contact_normal.x==0) {
          //println("COLLIDER MED NEDRE SIDE");
          player2Velocity.y=0;
        }
        PVector numericVelocity = new PVector(abs(rectangles.get(1).velocity.x), abs(rectangles.get(1).velocity.y));
        rectangles.get(1).velocity.x+=contact_normal.x*numericVelocity.x*(1-t_hit_near);
        println(rectangles.get(1).velocity.x);
        rectangles.get(1).velocity.y+=contact_normal.y*numericVelocity.y*(1-t_hit_near);
      }
    }
    if (amountOfPlayers==3) {
      if (DynamicRectVsRect(rectangles.get(1), rectangles.get(i))) {
        if (rectangles.get(i).type=="dangerTile") {
          //DET DER SKAL SKE HVIS LAVA ER BLEVET RØRT
          hasTouchedLava=true;
        }
        if (rectangles.get(i).type=="thornBush") {
          //DET DER SKAL SKE HVIS TORNEBUSK ER BLEVET RØRT
          hasTouchedLava=true;
        }
        if (rectangles.get(i).type=="finishline") {
          //DET DER SKAL SKE HVIS FINISHLINE ER BLEVET RØRT
          hasCompletedCurrentLevel=true;
        }

        if (contact_normal.x==-1&&contact_normal.y==0) {
          player2Position.x-=5;
        }
        if (contact_normal.x==1&&contact_normal.y==0) {
          player2Position.x+=5;
        }
        if (contact_normal.y==-1&&contact_normal.x==0) {
          player2Velocity.y=0;
          player2CanJump=true;
          player2IsJumping=false;
        }
        if (contact_normal.y==1&&contact_normal.x==0) {
          player2Velocity.y=0;
        }
        PVector numericVelocity = new PVector(abs(rectangles.get(1).velocity.x), abs(rectangles.get(1).velocity.y));
        rectangles.get(1).velocity.x+=contact_normal.x*numericVelocity.x*(1-t_hit_near);
        rectangles.get(1).velocity.y+=contact_normal.y*numericVelocity.y*(1-t_hit_near);
      }
      if (DynamicRectVsRect(rectangles.get(2), rectangles.get(i))) {
        if (rectangles.get(i).type=="dangerTile") {
          //DET DER SKAL SKE HVIS LAVA ER BLEVET RØRT
          hasTouchedLava=true;
        }
        if (rectangles.get(i).type=="thornBush") {
          //DET DER SKAL SKE HVIS TORNEBUSK ER BLEVET RØRT
          hasTouchedLava=true;
        }
        if (rectangles.get(i).type=="finishline") {
          //DET DER SKAL SKE HVIS FINISHLINE ER BLEVET RØRT
          hasCompletedCurrentLevel=true;
        }

        if (contact_normal.x==-1&&contact_normal.y==0) {
          player3Position.x-=5;
        }
        if (contact_normal.x==1&&contact_normal.y==0) {
          player3Position.x+=5;
        }
        if (contact_normal.y==-1&&contact_normal.x==0) {
          player3Velocity.y=0;
          player3CanJump=true;
          player3IsJumping=false;
        }
        if (contact_normal.y==1&&contact_normal.x==0) {
          player3Velocity.y=0;
        }
        PVector numericVelocity = new PVector(abs(rectangles.get(2).velocity.x), abs(rectangles.get(2).velocity.y));
        rectangles.get(2).velocity.x+=contact_normal.x*numericVelocity.x*(1-t_hit_near);
        rectangles.get(2).velocity.y+=contact_normal.y*numericVelocity.y*(1-t_hit_near);
      }
    }
  }
  player1Position.y+=rectangles.get(0).velocity.y;
  if (amountOfPlayers==2) {
    player2Position.y+=rectangles.get(1).velocity.y;
  }
  if (amountOfPlayers==3) {
    player2Position.y+=rectangles.get(1).velocity.y;
    player3Position.y+=rectangles.get(2).velocity.y;
  }

  gameController.levelGenerator.shiftDistance-=rectangles.get(0).velocity.x;
  if (amountOfPlayers==2) {
    player2Position.x-=rectangles.get(0).velocity.x;
  }
  if (amountOfPlayers==3) {
    player2Position.x-=rectangles.get(0).velocity.x;
    player3Position.x-=rectangles.get(0).velocity.x;
  }
  if (0<gameController.levelGenerator.shiftDistance) {
    gameController.levelGenerator.shiftDistance=0;
  }
  image(player1Drawing, rectangles.get(0).position.x, rectangles.get(0).position.y);
  if (amountOfPlayers==2) {
    image(player2Drawing, rectangles.get(1).position.x, rectangles.get(1).position.y);
  }
  if (amountOfPlayers==3) {
    image(player2Drawing, rectangles.get(1).position.x, rectangles.get(1).position.y);
    image(player3Drawing, rectangles.get(2).position.x, rectangles.get(2).position.y);
  }
}





boolean RayVsRect (PVector startingPoint, PVector endPoint, PVector pos2, PVector size2) {
  PVector directionVector = PVector.sub(endPoint, startingPoint);

  PVector t_near = new PVector((pos2.x-startingPoint.x)/directionVector.x, (pos2.y-startingPoint.y)/directionVector.y);
  PVector t_far = new PVector((pos2.x+size2.x-startingPoint.x)/directionVector.x, (pos2.y+size2.y-startingPoint.y)/directionVector.y);

  if (t_near.x > t_far.x) {
    float tempNearX = t_near.x;
    float tempFarX =t_far.x;
    t_far.set(tempNearX, t_far.y);
    t_near.set(tempFarX, t_near.y);
  }
  if (t_near.y>t_far.y) {
    float tempNearY = t_near.y;
    float tempFarY =t_far.y;
    t_far.set(t_far.x, tempNearY);
    t_near.set(t_near.x, tempFarY);
  }

  if (t_near.x > t_far.y || t_near.y>t_far.x) return false;

  t_hit_near = max(t_near.x, t_near.y);
  float t_hit_far = min(t_far.x, t_far.y);

  if (t_hit_far < 0) return false;



  contact_point = new PVector((startingPoint.x+t_hit_near*directionVector.x), (startingPoint.y+t_hit_near*directionVector.y));

  if (t_near.x>t_near.y) {
    if (directionVector.x<0)contact_normal = new PVector(1, 0);
    else contact_normal = new PVector(-1, 0);
  } else if (t_near.x<t_near.y) {
    if (directionVector.y<0) contact_normal = new PVector(0, 1);
    else contact_normal = new PVector(0, -1);
  }
  return true;
}

boolean DynamicRectVsRect(Rectangle incoming, Rectangle target) {
  if (incoming.velocity.x==0&&incoming.velocity.y==0)return false;
  PVector expandedRectangle_position = new PVector(target.position.x-incoming.size.x/2, target.position.y-incoming.size.y/2);
  PVector expandedRectangle_size = new PVector(target.size.x+incoming.size.x, target.size.y+incoming.size.y);
  if (RayVsRect(new PVector(incoming.position.x+incoming.size.x/2, incoming.position.y+incoming.size.y/2), 
  new PVector(incoming.velocity.x+incoming.position.x+incoming.size.x/2, incoming.velocity.y+incoming.position.y+incoming.size.y/2), 
  new PVector(expandedRectangle_position.x, expandedRectangle_position.y), 
  new PVector(expandedRectangle_size.x, expandedRectangle_size.y))) {
    if (t_hit_near<1&&-1<t_hit_near) {
      return true;
    }
  }
  return false;
}

void convertController1InputToAD() {
  if (player1Movement.x<-0.2) {
    player1A=true;
    player1D=false;
  }
  if (player1Movement.x>0.2) {
    player1D=true;
    player1A=false;
  }
  if (player1Movement.x>-0.2&&player1Movement.x<0.2) {
    player1D=false;
    player1A=false;
  }
}

void convertController2InputToAD() {
  if (player2Movement.x<-0.2) {
    player2A=true;
    player2D=false;
  }
  if (player2Movement.x>0.2) {
    player2D=true;
    player2A=false;
  }
  if (player2Movement.x>-0.2&&player2Movement.x<0.2) {
    player2D=false;
    player2A=false;
  }
}

void convertController3InputToAD() {
  if (player3Movement.x<-0.2) {
    player3A=true;
    player3D=false;
  }
  if (player3Movement.x>0.2) {
    player3D=true;
    player3A=false;
  }
  if (player3Movement.x>-0.2&&player3Movement.x<0.2) {
    player3D=false;
    player3A=false;
  }
}
