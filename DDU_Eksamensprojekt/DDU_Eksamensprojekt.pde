import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

float px=100, py;

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

int amountOfPlayers;




void setup(){
  size(1400,900);
  background(255);
  control = ControlIO.getInstance(this);
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
  
  if(amountOfPlayers==1){
    getPlayer1Inputs();
  }
  if(amountOfPlayers==2){
    getPlayer1Inputs();
    getPlayer2Inputs();
  }
  if(amountOfPlayers==3){
    getPlayer1Inputs();
    getPlayer2Inputs();
    getPlayer3Inputs();
  }
  
  
  
  
  
  //test af størrelsesforhold og koncept med at generere ens klodser ved siden af hinanden.
  background(255);
  rect(300+player1Movement.x*200,300+player1Movement.y*200,100,150);
  rect(0,800,100,100);
  rect(100,800,100,100);
  rect(200,800,100,100);
  rect(300,800,100,100);
  rect(400,800,100,100);
  rect(500,800,100,100);
  //println(px,py);
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
