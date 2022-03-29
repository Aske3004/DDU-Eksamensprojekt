ControlDevice player1,player2,player3;

class Player{
  PVector position,velocity,movement;
  float newX,newY;
  int playerNumber;
  String userControlsName;
  float px,py;
 
  
   
  
  
  Player(String userControlsName_,int playerNumber_){
    userControlsName=userControlsName_;
    playerNumber=playerNumber_;
    
   
    
    if(playerNumber==1){
      player1=control.filter(GCP.STICK).getMatchedDevice(userControlsName);
    }
    if(playerNumber==2){
      player2=control.filter(GCP.STICK).getMatchedDevice(userControlsName);
    }
    if(playerNumber==3){
      player3=control.filter(GCP.STICK).getMatchedDevice(userControlsName);
    }
  }
  
  
  void getPlayerInputs(){
    if(playerNumber==1){
      px = map(player1.getSlider("X position").getValue(), -1, 1, 0, 2)-1;
      py = map(player1.getSlider("Y position").getValue(), -1, 1, 0, 2)-1;
      player1.getButton("X-key").plug(this, "pressedX", ControlIO.ON_RELEASE);
      movement=new PVector(px,py);
    }
    if(playerNumber==2){
      px = map(player2.getSlider("X position").getValue(), -1, 1, 0, 2)-1;
      py = map(player2.getSlider("Y position").getValue(), -1, 1, 0, 2)-1;
      player2.getButton("X-key").plug(this, "pressedX", ControlIO.ON_RELEASE);
      movement=new PVector(px,py);
    }
    if(playerNumber==3){
      px = map(player3.getSlider("L3X").getValue(), -1, 1, 0, 2)-1;
      py = map(player3.getSlider("L3Y").getValue(), -1, 1, 0, 2)-1;
      player3.getButton("X").plug(this, "pressedX", ControlIO.ON_RELEASE);
      movement=new PVector(px,py);
      println(px,py);
    }
  }
  
  void pressedX(){
    
  }
  
 
  
  
}
