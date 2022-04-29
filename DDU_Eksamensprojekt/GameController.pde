int page=0;
PImage frontPage;

class GameController {
  Textfield username_field, password_field;
  SQL sql;
  Button players1,players2,players3,selectLevel1,selectLevel2,selectLevel3,selectLevel4,selectLevel5,frontPageLoginButton,backToSelectPlayers,chooseToSignIn,chooseToSignUp,continueFromLoginPage,playSelectedLevel,backToLoginPage;
  Cursor cursor;
  PFont theFont;

  
 

  GameController() {
    frontPage=loadImage("frontPage.png");
    
    theFont = createFont("Arial", 20);
    
    cp5.setColorBackground(color(160)); 
    cp5.setColorForeground(color(105));
    cp5.setColorActive(color(36));
    
    username_field = cp5.addTextfield("Brugernavn").setPosition(width/2, height/2).setSize(200, 40).setAutoClear(false).setFont(theFont).setVisible(false);
    username_field.setFocus(false).setColorBackground(color(160)).setColorValueLabel(0);

    password_field = cp5.addTextfield("Kodeord").setPosition(width/2, height/2+100).setSize(200, 40).setAutoClear(false).setFont(theFont).setVisible(false);
    password_field.setFocus(false).setColorBackground(color(160)).setColorValueLabel(0);

    sql = new SQL();
    cursor = new Cursor();
    
    
    //CREATE ALL POSSIBLE BUTTONS
    //players1=new Button();
    //players1=new Button();
    //players1=new Button();
    //selectLevel1=new Button();
    //selectLevel2=new Button();
    //selectLevel3=new Button();
    //selectLevel4=new Button();
    //selectLevel5=new Button();
    frontPageLoginButton=new Button(new PVector(509,382),new PVector(441,123),"goToPage2","firkant");
    //backToSelectPlayers = new Button();
    //chooseToSignIn= new Button();
    //chooseToSignUp= new Button();
    //continueFromLoginPage= new Button();
    //playSelectedLevel= new Button();
    //backToLoginPage= new Button();
    
    

  }

  void update() {
    
    if (page==0) {
      //STARTSIDE
      background(frontPage);
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
    }
    
    if (page==1) {
      //SPILSIDE
      if (amountOfPlayers==1) {
        getPlayer1Inputs();
        println(player1Movement);
        cursor.update();
      }
      if (amountOfPlayers==2) {
        getPlayer1Inputs();
        getPlayer2Inputs();
      }
      if (amountOfPlayers==3) {
        getPlayer1Inputs();
        getPlayer2Inputs();
        getPlayer3Inputs();
      }
      println("Current User: " + currentUser + "ReachedLevel: "+currentUnlockedLevel);





      //test af størrelsesforhold og koncept med at generere ens klodser ved siden af hinanden.
      background(255);
      //rect(300+player1Movement.x*200, 300+player1Movement.y*200, 100, 150);
      rect(0, 800, 100, 100);
      rect(100, 800, 100, 100);
      rect(200, 800, 100, 100);
      rect(300, 800, 100, 100);
      rect(400, 800, 100, 100);
      rect(500, 800, 100, 100);
      rect(300,600,100,180);
      //println(px,py);
      
      cursor.render();
    }
    
    if (page==2) {
      //LOGINSIDE
      background(255);
    }
    
    if (page==3) {
      //VÆLG ANTAL SPILLERE SIDE
      background(255);
      getPlayer1Inputs();
      cursor.update();
      cursor.render();
      
      
      
      
    }
    
    if (page==4) {
      //VÆLG BANE SIDE
      background(255);
    }
    
    if (page==5) {
      //BANE1
      background(255);
    }
    
    if (page==6) {
      //BANE2
      background(255);
    }
    
    if (page==7) {
      //BANE3
      background(255);
    }
    
    if (page==8) {
      //BANE4
      background(255);
    }
    
    if (page==9) {
      //BANE5
      background(255);
    }
    
  }
}
