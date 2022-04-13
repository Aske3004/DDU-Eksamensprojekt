String currentUser;
int currentUnlockedLevel;

void controlEvent(ControlEvent theEvent){
  //Login
  if (theEvent.getName() == "Login") {
    String userName = cp5.get(Textfield.class, "Brugernavn").getText();
    String password = cp5.get(Textfield.class, "Kodeord").getText();
    if (password != null && sql.login(userName, password)) {
      currentUser = userName;
      currentUnlockedLevel = sql.getReachedLevel(userName);
      cp5.get(Textfield.class, "Brugernavn").clear();
      cp5.get(Textfield.class, "Kodeord").clear();
      cp5.getController("Brugernavn").hide();
      cp5.getController("Kodeord").hide();
      cp5.getController("Login").hide();
      cp5.getController("Skab bruger").hide();
      page=1;
    } else {
      textSize(20);
      fill(255);
      text("Der skete en fejl", width/2, height-100);
    }
  }
  
  //Lav bruger
  if (theEvent.getName() == "Skab bruger") {
    String userName = cp5.get(Textfield.class, "Brugernavn").getText();
    String password = cp5.get(Textfield.class, "Kodeord").getText();
    println("-->"+userName+"<--");
    if (password != "" && userName != "" && userName!=null&&password!=null) {
      print("xxx"+userName+"xxx");
      sql.createUser(userName, password);
      cp5.get(Textfield.class, "Brugernavn").clear();
      cp5.get(Textfield.class, "Kodeord").clear();
      textSize(20);
      fill(255);
      println("Sucessfuldt");
      text("Bruger oprettet succesfuldt", width/2, height-100);
    } else {
      textSize(20);
      fill(255);
      println("Der skete en fejl");
      text("Der skete en fejl", width/2, height-100);
    }
  }
  
  
}
