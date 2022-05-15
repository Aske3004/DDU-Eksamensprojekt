class Button {
  PVector position, size;
  String action;
  String type;
  int diameter;

  Button(PVector pos, int dia, String act, String typ) {
    position=pos;
    type=typ;
    diameter=dia;
    action=act;
  }

  Button(PVector pos, PVector siz, String act, String typ) {
    position=pos;
    size=siz;
    action=act;
    type=typ;
  }

  void update() {
    if (type=="firkant") {
      boolean cursorPressX = position.x < gameController.cursor.position.x && gameController.cursor.position.x < position.x + size.x;
      boolean cursorPressY = position.y < gameController.cursor.position.y && gameController.cursor.position.y < position.y + size.y;
      if (cursorPressX && cursorPressY) {
        if (action=="goToPage2") {
          page=2;
          gameController.username_field.setVisible(true);
          gameController.password_field.setVisible(true);
        }
        if (action=="loggingIn") {
          loggingIn=true;
          signingUp=false;
        }
        if (action=="signingUp") {
          loggingIn=false;
          signingUp=true;
        }
        if (action=="continueFromLogin") {
          if (loggingIn) {
            String userName = cp5.get(Textfield.class, "Brugernavn").getText();
            String password = cp5.get(Textfield.class, "Kodeord").getText();
            if (password.length() > 0 && gameController.sql.login(userName, password)) {

              currentUser = userName;
              currentUnlockedLevel = gameController.sql.getReachedLevel(userName);
              cp5.get(Textfield.class, "Brugernavn").clear();
              cp5.get(Textfield.class, "Kodeord").clear();
              cp5.getController("Brugernavn").hide();
              cp5.getController("Kodeord").hide();
              page=3;
            } else {
              println("GET FUCKED");
              textSize(20);
              fill(255);
              text("Der skete en fejl", width/2, height-100);
            }
          }
          if (signingUp) {
            String userName = cp5.get(Textfield.class, "Brugernavn").getText();
            String password = cp5.get(Textfield.class, "Kodeord").getText();
            if (password.length()>0 && userName.length()>0) {
              gameController.sql.createUser(userName, password);
              cp5.get(Textfield.class, "Brugernavn").clear();
              cp5.get(Textfield.class, "Kodeord").clear();
            } else {

              textSize(20);
              fill(255);
              println("Der skete en fejl");
              text("Der skete en fejl", width/2, height-100);
            }
          }
        }
        if (action=="chose1Player") {
          amountOfPlayers = 1;
          page=4;
        }
        if (action=="chose2Player") {
          amountOfPlayers = 2;
          page=4;
          clickedOn2Player=true;
        }
        if (action=="chose3Player") {
          amountOfPlayers = 3;
          page=4;
          clickedOn3Player=true;
        }
        if (action=="playTheSelectedLevel") {
          if (clickedOnLevel==1) {
            gameController.levelGenerator=new LevelGenerator("level1Configuration.txt");
            player1Velocity.y=0;
            player1Position.y=height-400;
            if (amountOfPlayers==2) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
            }
            if (amountOfPlayers==3) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
              player3Velocity.y=0;
              player3Position.x=width/2-250;
              player3Position.y=height-400;
            }
            page=5;
            amountOfFramesInRun=0;
            clickedOnLevel=0;
          }
          if (clickedOnLevel==2) {
            gameController.levelGenerator=new LevelGenerator("level2Configuration.txt");
            player1Velocity.y=0;
            player1Position.y=height-400;
            if (amountOfPlayers==2) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
            }
            if (amountOfPlayers==3) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
              player3Velocity.y=0;
              player3Position.x=width/2-250;
              player3Position.y=height-400;
            }
            page=6;
            amountOfFramesInRun=0;
            clickedOnLevel=0;
          }
          if (clickedOnLevel==3) {
            gameController.levelGenerator=new LevelGenerator("level3Configuration.txt");
            player1Velocity.y=0;
            player1Position.y=height-400;
            if (amountOfPlayers==2) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
            }
            if (amountOfPlayers==3) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
              player3Velocity.y=0;
              player3Position.x=width/2-250;
              player3Position.y=height-400;
            }
            page=7;
            amountOfFramesInRun=0;
            clickedOnLevel=0;
          }
          if (clickedOnLevel==4) {
            gameController.levelGenerator=new LevelGenerator("level4Configuration.txt");
            player1Velocity.y=0;
            player1Position.y=height-400;
            if (amountOfPlayers==2) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
            }
            if (amountOfPlayers==3) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
              player3Velocity.y=0;
              player3Position.x=width/2-250;
              player3Position.y=height-400;
            }
            page=8;
            amountOfFramesInRun=0;
            clickedOnLevel=0;
          }
          if (clickedOnLevel==5) {
            gameController.levelGenerator=new LevelGenerator("level5Configuration.txt");
            player1Velocity.y=0;
            player1Position.y=height-400;
            if (amountOfPlayers==2) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
            }
            if (amountOfPlayers==3) {
              player2Velocity.y=0;
              player2Position.x=width/2-250;
              player2Position.y=height-400;
              player3Velocity.y=0;
              player3Position.x=width/2-250;
              player3Position.y=height-400;
            }
            page=9;
            amountOfFramesInRun=0;
            clickedOnLevel=0;
          }
        }
        if (action=="backToSelectoPlayers") {
          page=3;
          clickedOnLevel=0;
        }
        if (action=="resumeFromPauseMenu") {
          page=previousLevelPage;
        }
        if (action=="quitFromPauseMenu") {
          page=4;
        }
        if (action=="controlsFromPauseMenu") {
          previousPage=page;
          page=13;
        }
        if (action=="controlsFromStartScreen") {
          previousPage=page;
          page=13;
        }
        if (action=="returnFromControls") {
          page=previousPage;
        }



        println("RAMT KNAP");
      }
    }

    if (type=="cirkel") {

      boolean mouseOverCircle = dist(gameController.cursor.position.x, gameController.cursor.position.y, position.x, position.y) < diameter*0.5;

      if (mouseOverCircle) {
        if (action=="choseLevel1") {
          clickedOnLevel=1;
        }
        if (action=="choseLevel2") {
          clickedOnLevel=2;
        }
        if (action=="choseLevel3") {
          clickedOnLevel=3;
        }
        if (action=="choseLevel4") {
          clickedOnLevel=4;
        }
        if (action=="choseLevel5") {
          clickedOnLevel=5;
        }
      }
    }
  }
}
