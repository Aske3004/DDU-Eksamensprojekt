boolean loggingIn=true;
boolean signingUp=false;
int clickedOnLevel=0;
int amountOfFramesInRun;
int timeSinceDeath=0;
int timeSinceWin=0;

int page=0;
int previousPage;
PImage controlsScreen, alien2, alien1, hippo, whale, crab, meteorTile, finishline, winScreen, bigTree, deathScreen, waterTile, bigCactus, snake, thornBush, smallCactus, level3Background, pathLevel2, pathLevel3, pathLevel4, pathLevel5, level4Background, level5Background, pauseOverlay, frontPage, loginPage, selectPlayersPage, levelPick, level1Background, level2Background, lock, pathLevel1, lavaTile, displayBoard, player1Drawing, player2Drawing, player3Drawing;

int lastRunTime;

class GameController {
  Textfield username_field, password_field;
  SQL sql;
  Button returnFromControls, controlsFromStartScreen, resumeFromPauseMenu, quitFromPauseMenu, controlsFromPauseMenu, players1, players2, players3, selectLevel1, selectLevel2, selectLevel3, selectLevel4, selectLevel5, frontPageLoginButton, backToSelectPlayers, chooseToLogIn, chooseToSignUp, continueFromLoginPage, playSelectedLevel, backToLoginPage;
  Cursor cursor;
  LevelGenerator levelGenerator;
  PFont theFont;
  //CollisionController collisionController;




  GameController() {
    pauseOverlay=loadImage("pauseOverlay.png");
    frontPage=loadImage("frontPage.png");
    loginPage=loadImage("loginPage.png");
    selectPlayersPage=loadImage("selectPlayersPage.png");
    levelPick=loadImage("levelPick.png");
    level1Background=loadImage("level1Background.png");
    level2Background=loadImage("level2Background.png");
    level3Background=loadImage("level3Background.png");
    level4Background=loadImage("level4Background.png");
    level5Background=loadImage("level5Background.png");
    deathScreen=loadImage("deathScreen.png");
    winScreen=loadImage("winScreen.png");
    lock=loadImage("lock.png");
    controlsScreen=loadImage("controlsScreen.png");

    finishline=loadImage("finishline.png");

    pathLevel1=loadImage("pathLevel1.png");
    lavaTile=loadImage("lavaTile.png");
    thornBush=loadImage("thornBush.png");
    bigTree=loadImage("bigTree.png");
    //1=PATH,2=DANGERTILE,3=THORNBUSH,4=BIGTREE,9=FINISHLINE


    pathLevel2=loadImage("pathLevel2.png");
    smallCactus=loadImage("smallCactus.png");
    snake=loadImage("snake.png");
    bigCactus=loadImage("bigCactus.png");
    //1=PATH,2=DANGERTILE,3=SMALLCACTUS,4=SNAKE,5=BIGCACTUS,9=FINISHLINE


    pathLevel3=loadImage("pathLevel1.png");
    crab=loadImage("crab.png");
    whale=loadImage("whale.png");
    //1=PATH,2=DANGERTILE,3=CRAB,4=WHALE,9=FINISHLINE


    pathLevel4=loadImage("pathLevel1.png");
    waterTile=loadImage("waterTile.png");
    hippo=loadImage("hippo.png");
    //1=PATH,2=DANGERTILE,3=HIPPO,4=THORNBUSH,9=FINISHLINE


    pathLevel5=loadImage("pathLevel5.png");
    meteorTile=loadImage("meteorTile.png");
    alien1=loadImage("alien1.png");
    alien2=loadImage("alien2.png");
    //1=PATH,2=DANGERTILE,3=ALIEN1,4=ALIEN2,9=FINISHLINE


    displayBoard=loadImage("displayBoard.png");
    player1Drawing=loadImage("player1Drawing.png");
    player2Drawing=loadImage("player2Drawing.png");
    player3Drawing=loadImage("player3Drawing.png");


    theFont = createFont("Arial", 20);

    cp5.setColorBackground(color(160)); 
    cp5.setColorForeground(color(105));
    cp5.setColorActive(color(36));

    username_field = cp5.addTextfield("Brugernavn").setPosition(491, 321).setSize(440, 40).setAutoClear(false).setFont(theFont).setVisible(false);
    username_field.setFocus(false).setColorBackground(color(255)).setColorValueLabel(0).setColorBackground(color(255, 255, 255, 1)) ;

    password_field = cp5.addTextfield("Kodeord").setPosition(491, 506).setSize(440, 40).setAutoClear(false).setFont(theFont).setVisible(false);
    password_field.setFocus(false).setColorBackground(color(255)).setColorValueLabel(0).setPasswordMode(true).setColorBackground(color(255, 255, 255, 1)) ;

    sql = new SQL();
    cursor = new Cursor();


    //CREATE ALL POSSIBLE BUTTONS
    players1=new Button(new PVector(108, 330), new PVector(179, 319), "chose1Player", "firkant");
    players2=new Button(new PVector(501, 331), new PVector(306, 317), "chose2Player", "firkant");
    players3=new Button(new PVector(955, 335), new PVector(303, 319), "chose3Player", "firkant");
    selectLevel1=new Button(new PVector(94, 686), 140, "choseLevel1", "cirkel");
    selectLevel2=new Button(new PVector(358, 383), 140, "choseLevel2", "cirkel");
    selectLevel3=new Button(new PVector(659, 818), 140, "choseLevel3", "cirkel");
    selectLevel4=new Button(new PVector(966, 489), 140, "choseLevel4", "cirkel");
    selectLevel5=new Button(new PVector(1300, 794), 140, "choseLevel5", "cirkel");
    frontPageLoginButton=new Button(new PVector(509, 382), new PVector(441, 123), "goToPage2", "firkant");
    backToSelectPlayers = new Button(new PVector(29, 53), new PVector(207, 116), "backToSelectoPlayers", "firkant");
    chooseToLogIn= new Button(new PVector(483, 144), new PVector(133, 40), "loggingIn", "firkant");
    chooseToSignUp= new Button(new PVector(636, 142), new PVector(162, 42), "signingUp", "firkant");
    continueFromLoginPage= new Button(new PVector(804, 700), new PVector(141, 81), "continueFromLogin", "firkant");
    playSelectedLevel= new Button(new PVector(844, 184), new PVector(321, 68), "playTheSelectedLevel", "firkant");
    resumeFromPauseMenu=new Button(new PVector(571, 288), new PVector(258, 76), "resumeFromPauseMenu", "firkant");
    quitFromPauseMenu=new Button(new PVector(571, 419), new PVector(258, 76), "quitFromPauseMenu", "firkant");
    controlsFromPauseMenu=new Button(new PVector(571, 550), new PVector(258, 76), "controlsFromPauseMenu", "firkant");
    controlsFromStartScreen=new Button(new PVector(572, 525), new PVector(313, 91), "controlsFromStartScreen", "firkant");
    returnFromControls=new Button(new PVector(1091, 771), new PVector(211, 90), "returnFromControls", "firkant");
  }

  void update() {
    if (page==0) {
      //STARTSIDE
      background(frontPage);
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
    }

    if (page==2) {
      //LOGINSIDE
      background(loginPage);
      if (loggingIn) {
        strokeWeight(4);
        line(483, 144, 483, 184);
        line(483, 144, 616, 144);
        line(483, 184, 616, 184);
        line(616, 144, 616, 184);
      }
      if (signingUp) {
        strokeWeight(4);
        line(636, 142, 636, 184);
        line(636, 142, 798, 142);
        line(636, 184, 798, 184);
        line(798, 142, 798, 184);
      }
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
    }

    if (page==3) {
      //VÆLG ANTAL SPILLERE SIDE
      background(selectPlayersPage);
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
    }

    if (page==4) {
      //VÆLG BANE SIDE
      background(levelPick);
      if (currentUnlockedLevel==1) {
        image(lock, 301, 308);
        image(lock, 605, 741);
        image(lock, 912, 407);
        image(lock, 1245, 718);
      }
      if (currentUnlockedLevel==2) {
        image(lock, 605, 741);
        image(lock, 912, 407);
        image(lock, 1245, 718);
      }
      if (currentUnlockedLevel==3) {
        image(lock, 912, 407);
        image(lock, 1245, 718);
      }
      if (currentUnlockedLevel==4) {
        image(lock, 1245, 718);
      }
      if (currentUnlockedLevel==5) {
        //println("alt åbnet");
      }
      if (clickedOnLevel!=0) {
        image(displayBoard, 830, 0);
        textAlign(CORNER);
        textSize(40);
        fill(0);
        if (clickedOnLevel==1) {
          text(sql.getTimeForLevel1(currentUser)+" s", 1120, 45);
          String sql_command = "SELECT * FROM Users";
          db.query(sql_command);
          int fastestTime = 999999;
          //String fastestTimeUsername = "";
          while (db.next()) {
            if (db.getInt("Level1Time") < fastestTime && db.getInt("Level1Time")!=0) {
              fastestTime = db.getInt("Level1Time"); 
              //fastestTimeUsername = db.getString("Username");
            }
          }
          text(fastestTime+" s", 1154, 130);
        }
        if (clickedOnLevel==2) {
          text(sql.getTimeForLevel2(currentUser)+" s", 1120, 45);
          String sql_command = "SELECT * FROM Users";
          db.query(sql_command);
          int fastestTime = 999999;
          //String fastestTimeUsername = "";
          while (db.next()) {
            if (db.getInt("Level2Time") < fastestTime && db.getInt("Level2Time")!=0) {
              fastestTime = db.getInt("Level2Time"); 
              //fastestTimeUsername = db.getString("Username");
            }
          }
          text(fastestTime+" s", 1154, 130);
        }
        if (clickedOnLevel==3) {
          text(sql.getTimeForLevel3(currentUser)+" s", 1120, 45);
          String sql_command = "SELECT * FROM Users";
          db.query(sql_command);
          int fastestTime = 999999;
          //String fastestTimeUsername = "";
          while (db.next()) {
            if (db.getInt("Level3Time") < fastestTime && db.getInt("Level3Time")!=0) {
              fastestTime = db.getInt("Level3Time"); 
              //fastestTimeUsername = db.getString("Username");
            }
          }
          text(fastestTime+" s", 1154, 130);
        }
        if (clickedOnLevel==4) {
          text(sql.getTimeForLevel4(currentUser)+" s", 1120, 45);
          String sql_command = "SELECT * FROM Users";
          db.query(sql_command);
          int fastestTime = 999999;
          //String fastestTimeUsername = "";
          while (db.next()) {
            if (db.getInt("Level4Time") < fastestTime && db.getInt("Level4Time")!=0) {
              fastestTime = db.getInt("Level4Time"); 
              //fastestTimeUsername = db.getString("Username");
            }
          }
          text(fastestTime+" s", 1154, 130);
        }
        if (clickedOnLevel==5) {
          text(sql.getTimeForLevel5(currentUser)+" s", 1120, 45);
          String sql_command = "SELECT * FROM Users";
          db.query(sql_command);
          int fastestTime = 999999;
          //String fastestTimeUsername = "";
          while (db.next()) {
            if (db.getInt("Level5Time") < fastestTime && db.getInt("Level5Time")!=0) {
              fastestTime = db.getInt("Level5Time"); 
              //fastestTimeUsername = db.getString("Username");
            }
          }
          text(fastestTime+" s", 1154, 130);
        }

        text(clickedOnLevel, 1085, 232);
      }
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
    }

    if (page==5) {
      //BANE1
      background(level1Background);
      amountOfFramesInRun++;
      getPlayer1Inputs();
      convertController1InputToAD();
      if (amountOfPlayers==2) {
        getPlayer2Inputs();
        convertController2InputToAD();
      }
      if (amountOfPlayers==3) {
        getPlayer2Inputs();
        convertController2InputToAD();
        getPlayer3Inputs();
        convertController3InputToAD();
      }

      runInDraw();


      if (hasTouchedLava) {
        page=11;
        timeSinceDeath=0;
        hasTouchedLava=false;
      }

      if (hasCompletedCurrentLevel) {
        if (amountOfFramesInRun/60<sql.getTimeForLevel1(currentUser)||sql.getTimeForLevel1(currentUser)==0) {
          sql.updateTimeForLevel1(amountOfFramesInRun/60);
        }
        if (sql.getReachedLevel(currentUser)>1) {
          page=12;
          hasCompletedCurrentLevel=false;
        } else {
          sql.updateReachedLevel(2);
        }
        currentUnlockedLevel=sql.getReachedLevel(currentUser);
        hasCompletedCurrentLevel=false;
        page=12;
        timeSinceWin=0;
        lastRunTime=amountOfFramesInRun/60;
      }

      text(int(amountOfFramesInRun/60), 10, 35);
    }

    if (page==6) {
      //BANE2
      background(level2Background);
      amountOfFramesInRun++;
      getPlayer1Inputs();
      convertController1InputToAD();
      if (amountOfPlayers==2) {
        getPlayer2Inputs();
        convertController2InputToAD();
      }
      if (amountOfPlayers==3) {
        getPlayer2Inputs();
        convertController2InputToAD();
        getPlayer3Inputs();
        convertController3InputToAD();
      }

      runInDraw();

      if (hasTouchedLava) {
        page=11;
        timeSinceDeath=0;
        hasTouchedLava=false;
      }

      if (hasCompletedCurrentLevel) {
        if (amountOfFramesInRun/60<sql.getTimeForLevel2(currentUser)||sql.getTimeForLevel2(currentUser)==0) {
          sql.updateTimeForLevel2(amountOfFramesInRun/60);
        }
        if (sql.getReachedLevel(currentUser)>2) {
          page=12;
          hasCompletedCurrentLevel=false;
        } else {
          sql.updateReachedLevel(3);
        }
        currentUnlockedLevel=sql.getReachedLevel(currentUser);
        hasCompletedCurrentLevel=false;
        page=12;
        timeSinceWin=0;
        lastRunTime=amountOfFramesInRun/60;
      }

      text(int(amountOfFramesInRun/60), 10, 35);
    }

    if (page==7) {
      //BANE3
      background(level3Background);
      amountOfFramesInRun++;
      getPlayer1Inputs();
      convertController1InputToAD();
      if (amountOfPlayers==2) {
        getPlayer2Inputs();
        convertController2InputToAD();
      }
      if (amountOfPlayers==3) {
        getPlayer2Inputs();
        convertController2InputToAD();
        getPlayer3Inputs();
        convertController3InputToAD();
      }

      runInDraw();

      if (hasTouchedLava) {
        page=11;
        timeSinceDeath=0;
        hasTouchedLava=false;
      }

      if (hasCompletedCurrentLevel) {
        if (amountOfFramesInRun/60<sql.getTimeForLevel3(currentUser)||sql.getTimeForLevel3(currentUser)==0) {
          sql.updateTimeForLevel3(amountOfFramesInRun/60);
        }
        if (sql.getReachedLevel(currentUser)>3) {
          page=12;
          hasCompletedCurrentLevel=false;
        } else {
          sql.updateReachedLevel(4);
        }
        currentUnlockedLevel=sql.getReachedLevel(currentUser);
        hasCompletedCurrentLevel=false;
        page=12;
        timeSinceWin=0;
        lastRunTime=amountOfFramesInRun/60;
      }

      text(int(amountOfFramesInRun/60), 10, 35);
    }

    if (page==8) {
      //BANE4
      background(level4Background);
      amountOfFramesInRun++;
      getPlayer1Inputs();
      convertController1InputToAD();
      if (amountOfPlayers==2) {
        getPlayer2Inputs();
        convertController2InputToAD();
      }
      if (amountOfPlayers==3) {
        getPlayer2Inputs();
        convertController2InputToAD();
        getPlayer3Inputs();
        convertController3InputToAD();
      }

      runInDraw();

      if (hasTouchedLava) {
        page=11;
        timeSinceDeath=0;
        hasTouchedLava=false;
      }

      if (hasCompletedCurrentLevel) {
        if (amountOfFramesInRun/60<sql.getTimeForLevel4(currentUser)||sql.getTimeForLevel4(currentUser)==0) {
          sql.updateTimeForLevel4(amountOfFramesInRun/60);
        }
        if (sql.getReachedLevel(currentUser)>4) {
          page=12;
          hasCompletedCurrentLevel=false;
        } else {
          sql.updateReachedLevel(5);
        }
        currentUnlockedLevel=sql.getReachedLevel(currentUser);
        hasCompletedCurrentLevel=false;
        page=12;
        timeSinceWin=0;
        lastRunTime=amountOfFramesInRun/60;
      }

      text(int(amountOfFramesInRun/60), 10, 35);
    }

    if (page==9) {
      //BANE5
      background(level5Background);
      amountOfFramesInRun++;
      getPlayer1Inputs();
      convertController1InputToAD();
      if (amountOfPlayers==2) {
        getPlayer2Inputs();
        convertController2InputToAD();
      }
      if (amountOfPlayers==3) {
        getPlayer2Inputs();
        convertController2InputToAD();
        getPlayer3Inputs();
        convertController3InputToAD();
      }

      runInDraw();

      if (hasTouchedLava) {
        page=11;
        timeSinceDeath=0;
        hasTouchedLava=false;
      }

      if (hasCompletedCurrentLevel) {
        if (amountOfFramesInRun/60<sql.getTimeForLevel5(currentUser)||sql.getTimeForLevel5(currentUser)==0) {
          sql.updateTimeForLevel5(amountOfFramesInRun/60);
        }
        currentUnlockedLevel=sql.getReachedLevel(currentUser);
        hasCompletedCurrentLevel=false;
        page=12;
        timeSinceWin=0;
        lastRunTime=amountOfFramesInRun/60;
      }

      text(int(amountOfFramesInRun/60), 10, 35);
    }

    if (page==10) {
      //OPTIONS OVERLAY
      image(pauseOverlay, 400, 125);
      println("Der er pauset");
      getPlayer1Inputs();
      cursor.update();
      if (cursor.position.x<400) {
        cursor.position.x=400;
      }
      if (cursor.position.x>1000-24) {
        cursor.position.x=1000-24;
      }
      if (cursor.position.y<125) {
        cursor.position.y=125;
      }
      if (cursor.position.y>775-38) {
        cursor.position.y=775-38;
      }
      cursor.render();
    }

    if (page==13) {
      //CONTROLSPAGE
      background(controlsScreen);
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
    }

    if (page==11) {
      //DEATHSCREEN
      background(deathScreen);
      timeSinceDeath++;
      if (timeSinceDeath/60>3) {
        page=4;
      }
    }
    if (page==12) {
      //WINSCREEN
      background(winScreen);
      timeSinceWin++;
      if (timeSinceWin/60>3) {
        page=4;
      }
      textSize(50);
      text(lastRunTime+" s", width/2-75, height/2-50);
    }
  }
}
