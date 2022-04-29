class Button{
  PVector position,size;
  String action;
  String type;
  int diameter;
  
  Button(int dia, PVector pos, String typ, String act){
    position=pos;
    type=typ;
    diameter=dia;
    action=act;
  }
  
  Button(PVector pos, PVector siz, String act, String typ){
    position=pos;
    size=siz;
    action=act;
    type=typ;
  }
  
  void update(){
    if(type=="firkant"){
    boolean cursorPressX = position.x < gameController.cursor.position.x && gameController.cursor.position.x < position.x + size.x;
    boolean cursorPressY = position.y < gameController.cursor.position.y && gameController.cursor.position.y < position.y + size.y;
    if (cursorPressX && cursorPressY) {
      if(action=="goToPage2"){
        page=2;
      }
      
      println("RAMT KNAP");
    }
    }
    
    if(type=="cirkel"){
      
    }
    
    
  }
}
