Textfield username_field, password_field;
Button login;

SQL sql;
int page=0;

class GameController {


  GameController() {
    cp5.addButton("Login").setPosition(width/2, height/2-150).setSize(80, 40).setVisible(true);
    cp5.addButton("Skab bruger").setPosition(width/2, height/2-200).setSize(80, 40).setVisible(true);
    cp5.setColorBackground(color(160)); 
    cp5.setColorForeground(color(105));
    cp5.setColorActive(color(36));
    
    username_field = cp5.addTextfield("Brugernavn").setPosition(width/2, height/2).setSize(200, 40).setAutoClear(false).setFont(theFont).setVisible(true).setFocus(false);
    username_field.setFocus(false).setColorBackground(color(160)).setColorValueLabel(0);

    password_field = cp5.addTextfield("Kodeord").setPosition(width/2, height/2+100).setSize(200, 40).setAutoClear(false).setFont(theFont).setVisible(true);
    password_field.setFocus(false).setColorBackground(color(160)).setColorValueLabel(0);

    sql = new SQL();

  }

  void update() {
    if (page==0) {
      background(255);
    }
    if (page==1) {
      if (amountOfPlayers==1) {
        getPlayer1Inputs();
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
      rect(300+player1Movement.x*200, 300+player1Movement.y*200, 100, 150);
      rect(0, 800, 100, 100);
      rect(100, 800, 100, 100);
      rect(200, 800, 100, 100);
      rect(300, 800, 100, 100);
      rect(400, 800, 100, 100);
      rect(500, 800, 100, 100);
      //println(px,py);
    }
  }
}
