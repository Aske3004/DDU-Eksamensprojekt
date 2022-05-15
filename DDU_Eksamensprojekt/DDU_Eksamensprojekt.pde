//Game Control Plus
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

//BezierSQLib
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
SQLite db;

//ControlP5
import controlP5.*;
ControlP5 cp5;

//Hash
import java.security.*;

//laver vores gamecontrolplus
ControlIO control;

//Player 1 controls
ControlDevice player1;
float player1XPosition, player1YPosition;
PVector player1Position=new PVector(width/2+400, height+200);
PVector player1Movement;
float player1NewX, player1NewY;
PVector player1Velocity = new PVector();
boolean player1IsJumping=false;
boolean player1CanJump=false;
//PVector player1Gravity = new PVector(0,0.1);

//Player 2 controls
ControlDevice player2;
float player2XPosition, player2YPosition;
PVector player2Position=new PVector(width/2+400, height+200);
PVector player2Movement;
float player2NewX, player2NewY;
PVector player2Velocity = new PVector();
boolean player2IsJumping=false;
boolean player2CanJump=false;
//PVector player2Gravity = new PVector(0, 0.1);

//Player 3 controls
ControlDevice player3;
float player3XPosition, player3YPosition;
PVector player3Position=new PVector(width/2+400, height+200);
PVector player3Movement;
float player3NewX, player3NewY;
PVector player3Velocity = new PVector();
boolean player3IsJumping=false;
boolean player3CanJump=false;

GameController gameController;
int amountOfPlayers;
boolean clickedOn2Player= false;
boolean clickedOn3Player= false;

int previousLevelPage;


void setup() {
  size(1400, 900);
  frameRate(60);
  control = ControlIO.getInstance(this);
  db = new SQLite(this, "Users.sqlite" );
  db.connect();
  cp5 = new ControlP5(this);
  gameController=new GameController();
  amountOfPlayers=1;


  //Create inputs based on amount of players

  player1=control.filter(GCP.STICK).getMatchedDevice("Player1");
  player1.getButton("X").plug(this, "player1XHasBeenPressed", ControlIO.ON_RELEASE);
  player1.getButton("Options").plug(this, "player1OptionsBeenPressed", ControlIO.ON_RELEASE);
}

void draw() {
  gameController.update();
  //println(currentUnlockedLevel);
  //println(clickedOnLevel);

  if (clickedOn2Player) {
    player2=control.filter(GCP.STICK).getMatchedDevice("Player2");
    player2.getButton("X").plug(this, "player2XHasBeenPressed", ControlIO.ON_RELEASE);
    player2.getButton("Options").plug(this, "player2OptionsBeenPressed", ControlIO.ON_RELEASE);
    clickedOn2Player=false;
  }

  if (clickedOn3Player) {
    player2=control.filter(GCP.STICK).getMatchedDevice("Player2");
    player2.getButton("X").plug(this, "player2XHasBeenPressed", ControlIO.ON_RELEASE);
    player2.getButton("Options").plug(this, "player2OptionsBeenPressed", ControlIO.ON_RELEASE);

    player3=control.filter(GCP.STICK).getMatchedDevice("Player3");
    player3.getButton("X").plug(this, "player3XHasBeenPressed", ControlIO.ON_RELEASE);
    player3.getButton("Options").plug(this, "player3OptionsBeenPressed", ControlIO.ON_RELEASE);
    clickedOn3Player=false;
  }
}





//PLAYER 1 INPUTS:
void getPlayer1Inputs() {
  player1XPosition = map(player1.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
  player1YPosition = map(player1.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
  player1Movement = new PVector(player1XPosition, player1YPosition);
}

void player1XHasBeenPressed() {
  if (page==0) {
    gameController.frontPageLoginButton.update();
    gameController.controlsFromStartScreen.update();
  }

  if (page==2) {

    //INTERACTION WITH TEXTFIELD
    boolean cursorPressX = 491 < gameController.cursor.position.x && gameController.cursor.position.x < 491+440;
    boolean cursorPressY = 321 < gameController.cursor.position.y && gameController.cursor.position.y < 321+40;
    if (cursorPressX && cursorPressY) {
      gameController.username_field.setFocus(true);
      gameController.password_field.setFocus(false);
    }
    cursorPressX = 491 < gameController.cursor.position.x && gameController.cursor.position.x < 491+440;
    cursorPressY = 506 < gameController.cursor.position.y && gameController.cursor.position.y < 506+40;
    if (cursorPressX && cursorPressY) {
      gameController.username_field.setFocus(false);
      gameController.password_field.setFocus(true);
    }
    gameController.chooseToLogIn.update();
    gameController.chooseToSignUp.update();
    gameController.continueFromLoginPage.update();
  } 


  if (page==3) {
    gameController.players1.update();
    gameController.players2.update();
    gameController.players3.update();
  }

  if (page==4) {
    gameController.backToSelectPlayers.update();

    if (currentUnlockedLevel==1) {
      gameController.selectLevel1.update();
    }
    if (currentUnlockedLevel==2) {

      gameController.selectLevel1.update();
      gameController.selectLevel2.update();
    }
    if (currentUnlockedLevel==3) {

      gameController.selectLevel1.update();
      gameController.selectLevel2.update();
      gameController.selectLevel3.update();
    }
    if (currentUnlockedLevel==4) {

      gameController.selectLevel1.update();
      gameController.selectLevel2.update();
      gameController.selectLevel3.update();
      gameController.selectLevel4.update();
    }
    if (currentUnlockedLevel==5) {

      gameController.selectLevel1.update();
      gameController.selectLevel2.update();
      gameController.selectLevel3.update();
      gameController.selectLevel4.update();
      gameController.selectLevel5.update();
    }
    if (clickedOnLevel!=0) {
      gameController.playSelectedLevel.update();
    }
  }
  if (page==5) {
    if (player1CanJump) {
      player1Velocity = new PVector(0, -19);
      player1IsJumping=true;
      player1CanJump=false;
    }
  }
  if (page==6) {
    if (player1CanJump) {
      player1Velocity = new PVector(0, -19);
      player1IsJumping=true;
      player1CanJump=false;
    }
  }
  if (page==7) {
    if (player1CanJump) {
      player1Velocity = new PVector(0, -19);
      player1IsJumping=true;
      player1CanJump=false;
    }
  }
  if (page==8) {
    if (player1CanJump) {
      player1Velocity = new PVector(0, -19);
      player1IsJumping=true;
      player1CanJump=false;
    }
  }
  if (page==9) {
    if (player1CanJump) {
      player1Velocity = new PVector(0, -19);
      player1IsJumping=true;
      player1CanJump=false;
    }
  }

  if (page==10) {
    gameController.resumeFromPauseMenu.update();
    gameController.quitFromPauseMenu.update();
    gameController.controlsFromPauseMenu.update();
  }
  if (page==13) {
    //CONTROLS
    gameController.returnFromControls.update();
  }
}

void player1OptionsBeenPressed() {
  if (page==5||page==6||page==7||page==8||page==9) {
    previousLevelPage=page;
    page=10;
  }
}


//PLAYER 2 INPUTS:
void getPlayer2Inputs() {
  player2XPosition = map(player2.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
  player2YPosition = map(player2.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
  player2Movement = new PVector(player2XPosition, player2YPosition);
  //println(player2Movement);
}

void player2XHasBeenPressed() {
  if (page==5) {
    if (player2CanJump) {
      player2Velocity = new PVector(0, -19);
      player2IsJumping=true;
      player2CanJump=false;
    }
  }
  if (page==6) {
    if (player2CanJump) {
      player2Velocity = new PVector(0, -19);
      player2IsJumping=true;
      player2CanJump=false;
    }
  }
  if (page==7) {
    if (player2CanJump) {
      player2Velocity = new PVector(0, -19);
      player2IsJumping=true;
      player2CanJump=false;
    }
  }
  if (page==8) {
    if (player2CanJump) {
      player2Velocity = new PVector(0, -19);
      player2IsJumping=true;
      player2CanJump=false;
    }
  }
  if (page==9) {
    if (player2CanJump) {
      player2Velocity = new PVector(0, -19);
      player2IsJumping=true;
      player2CanJump=false;
    }
  }
}

void player2OptionsBeenPressed() {
  if (page==5||page==6||page==7||page==8||page==9) {
    previousLevelPage=page;
    page=10;
  }
}


//PLAYER 3 INPUTS:
void getPlayer3Inputs() {
  player3XPosition = map(player3.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
  player3YPosition = map(player3.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
  player3Movement = new PVector(player3XPosition, player3YPosition);
  println(player3Movement);
}

void player3XHasBeenPressed() {
  if (page==5) {
    if (player3CanJump) {
      player3Velocity = new PVector(0, -19);
      player3IsJumping=true;
      player3CanJump=false;
    }
  }
  if (page==6) {
    if (player3CanJump) {
      player3Velocity = new PVector(0, -19);
      player3IsJumping=true;
      player3CanJump=false;
    }
  }
  if (page==7) {
    if (player3CanJump) {
      player3Velocity = new PVector(0, -19);
      player3IsJumping=true;
      player3CanJump=false;
    }
  }
  if (page==8) {
    if (player3CanJump) {
      player3Velocity = new PVector(0, -19);
      player3IsJumping=true;
      player3CanJump=false;
    }
  }
  if (page==9) {
    if (player3CanJump) {
      player3Velocity = new PVector(0, -19);
      player3IsJumping=true;
      player3CanJump=false;
    }
  }
}

void player3OptionsBeenPressed() {
  if (page==5||page==6||page==7||page==8||page==9) {
    previousLevelPage=page;
    page=10;
  }
}
