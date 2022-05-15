class Cursor{
  PVector position;
  float newX,newY;
  PImage cursorPhoto;
  
  Cursor(){
    cursorPhoto = loadImage("Cursor.png");
    newX=width/2;
    newY=height/2;
    position = new PVector(width/2,height/2);
  }
  
  void update(){
    //Make the player move if the stick is out of the deadzone
    if(player1Movement.x<-0.2||player1Movement.x>0.2){
    newX = position.x+player1Movement.x*8;
    }
    else player1Movement.x=0;
    if(player1Movement.y<-0.2||player1Movement.y>0.2){
    newY = position.y+player1Movement.y*8;
    }
    else player1Movement.y=0;
    
    position.set(newX, newY, 0.);
    if(position.y>height)position.y=height;
    if(position.y<0)position.y=0;
    if(position.x>width)position.x=width;
    if(position.x<0)position.x=0;
  }
  
  void render(){
    image(cursorPhoto,position.x,position.y);
  }
  
}
