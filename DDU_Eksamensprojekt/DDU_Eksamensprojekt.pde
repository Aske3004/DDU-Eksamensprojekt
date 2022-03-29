import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

float px=100, py;

ControlIO control;
ControlDevice stick;

boolean trailOn;

Player firstPlayer;
Player secondPlayer;
Player thirdPlayer;




void setup(){
  size(1400,900);
  background(255);
  control = ControlIO.getInstance(this);
  
  firstPlayer = new Player("Player3",3);
  
  //stick = control.filter(GCP.STICK).getMatchedDevice("Player1");
}

void draw(){
  //getUserInput();
  firstPlayer.getPlayerInputs();
  
  
  background(255);
  rect(px,600,100,150);
  rect(0,800,100,100);
  rect(100,800,100,100);
  rect(200,800,100,100);
  rect(300,800,100,100);
  rect(400,800,100,100);
  rect(500,800,100,100);
  //println(px,py);
}

void getUserInput() {
  px = map(stick.getSlider("X").getValue(), -1, 1, 0, width);
  py = map(stick.getSlider("Y").getValue(), -1, 1, 0, height);
}



//Kamera skal følge bagerste spiller
//Bagerste spiller skal være i centrum for skærmen
