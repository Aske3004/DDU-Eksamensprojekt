class SQL{
  String signingSalt = "sQLLlerkk4221€€))";
  
  String getUser(String userName) {
    db.query("SELECT Username FROM Users WHERE Username='"+ userName + "'");
    String username = db.getString("userName");
    if (username != null) {
      return username;
    } else {
      return "";
    }
  }
  
  String getPassword(String userName) {
    db.query("SELECT Password FROM Users WHERE Username='"+ userName + "'");
    String userPassword = db.getString("Password");
    return userPassword;
  }
  
  void createUser(String userName, String password) {
    password = hash(password);
    int reachedLevel = 1;
    db.query("INSERT INTO Users VALUES ('"+ userName + "', '"+ password +"',"+ reachedLevel +",null,null,null,null,null)");
  }
  
  boolean login(String userName, String password) {
    password = hash(password);
    if (getUser(userName)   == "") return false;
    if (password.equals(getPassword(userName))) return true;
    else return false;
  }
  
  int getReachedLevel(String userName){
    db.query("SELECT ReachedLevel FROM Users WHERE Username='"+ userName + "'");
    int theReachedLevel = db.getInt("ReachedLevel");
    return theReachedLevel;
  }
  int getTimeForLevel1(String userName){
    db.query("SELECT Level1Time FROM Users WHERE Username='"+ userName + "'");
    int theTimeForLevel = db.getInt("Level1Time");
    return theTimeForLevel;
  }
  int getTimeForLevel2(String userName){
    db.query("SELECT Level2Time FROM Users WHERE Username='"+ userName + "'");
    int theTimeForLevel = db.getInt("Level2Time");
    return theTimeForLevel;
  }
  int getTimeForLevel3(String userName){
    db.query("SELECT Level3Time FROM Users WHERE Username='"+ userName + "'");
    int theTimeForLevel = db.getInt("Level3Time");
    return theTimeForLevel;
  }
  int getTimeForLevel4(String userName){
    db.query("SELECT Level4Time FROM Users WHERE Username='"+ userName + "'");
    int theTimeForLevel = db.getInt("Level4Time");
    return theTimeForLevel;
  }
  int getTimeForLevel5(String userName){
    db.query("SELECT Level5Time FROM Users WHERE Username='"+ userName + "'");
    int theTimeForLevel = db.getInt("Level5Time");
    return theTimeForLevel;
  }
  
  
  
  
  
  
  String hash(String input) {
    try {
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      String inputText = input + signingSalt;
      md.update(inputText.getBytes());
      byte[] byteList = md.digest();

      StringBuffer hashedValueBuffer = new StringBuffer();
      for (byte b : byteList)hashedValueBuffer.append(hex(b));
      return hashedValueBuffer.toString();
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
    return null;
  }
  
}
