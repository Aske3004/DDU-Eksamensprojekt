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
float player1XPosition,player1YPosition;
PVector player1Movement;

//Player 2 controls
ControlDevice player2;
float player2XPosition,player2YPosition;
PVector player2Movement;

//Player 3 controls
ControlDevice player3;
float player3XPosition,player3YPosition;
PVector player3Movement;


GameController gameController;
int amountOfPlayers;


void setup(){
  size(1400,900);
  control = ControlIO.getInstance(this);
  db = new SQLite(this, "Users.sqlite" );
  db.connect();
  cp5 = new ControlP5(this);
  gameController=new GameController();
  amountOfPlayers=1;
  
  
  //Create inputs based on amount of players
  if(amountOfPlayers==1){
    player1=control.filter(GCP.STICK).getMatchedDevice("Player1");
    player1.getButton("X").plug(this, "player1XHasBeenPressed", ControlIO.ON_RELEASE);
  }
  
  if(amountOfPlayers==2){
    player1=control.filter(GCP.STICK).getMatchedDevice("Player1");
    player1.getButton("X").plug(this, "player1XHasBeenPressed", ControlIO.ON_RELEASE);
    
    player2=control.filter(GCP.STICK).getMatchedDevice("Player2");
    player2.getButton("X").plug(this, "player2XHasBeenPressed", ControlIO.ON_RELEASE);
  }
  
  if(amountOfPlayers==3){
    player1=control.filter(GCP.STICK).getMatchedDevice("Player1");
    player1.getButton("X").plug(this, "player1XHasBeenPressed", ControlIO.ON_RELEASE);
    
    player2=control.filter(GCP.STICK).getMatchedDevice("Player2");
    player2.getButton("X").plug(this, "player2XHasBeenPressed", ControlIO.ON_RELEASE);
    
    player3=control.filter(GCP.STICK).getMatchedDevice("Player3");
    player3.getButton("X").plug(this, "player3XHasBeenPressed", ControlIO.ON_RELEASE);
  }
}

void draw(){
  gameController.update();
  println(page);
}





//PLAYER 1 INPUTS:
void getPlayer1Inputs(){
      player1XPosition = map(player1.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
      player1YPosition = map(player1.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
      player1Movement = new PVector(player1XPosition,player1YPosition);
      //println(player1Movement);
}

void player1XHasBeenPressed(){
    println("Jep1");
    
    if(page==0){
      gameController.frontPageLoginButton.update();
    }
    
    if(page==3){
    gameController.players1.update();
    gameController.players2.update();
    gameController.players3.update();
    }
    
    if(page==1){
      
      //INTERACTION WITH TEXTFIELD
      boolean cursorPressX = width/2 < gameController.cursor.position.x && gameController.cursor.position.x < width/2 + 200;
      boolean cursorPressY = height/2 < gameController.cursor.position.y && gameController.cursor.position.y < height/2 + 40;
      if (cursorPressX && cursorPressY) {
        gameController.username_field.setFocus(true);
        gameController.password_field.setFocus(false);
      }
      cursorPressX = width/2 < gameController.cursor.position.x && gameController.cursor.position.x < width/2 + 200;
      cursorPressY = height/2+100 < gameController.cursor.position.y && gameController.cursor.position.y < height/2+100 + 40;
      if (cursorPressX && cursorPressY) {
        gameController.username_field.setFocus(false);
        gameController.password_field.setFocus(true);
      }
    } 
  }

//PLAYER 2 INPUTS:
  void getPlayer2Inputs(){
      player2XPosition = map(player2.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
      player2YPosition = map(player2.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
      player2Movement = new PVector(player2XPosition,player2YPosition);
      println(player2Movement);
}
  
  void player2XHasBeenPressed(){
    println("Jep2");
  }

//PLAYER 3 INPUTS:
  void getPlayer3Inputs(){
      player3XPosition = map(player3.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
      player3YPosition = map(player3.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
      player3Movement = new PVector(player3XPosition,player3YPosition);
      println(player3Movement);
}
  
  void player3XHasBeenPressed(){
    println("Jep3");
  }
