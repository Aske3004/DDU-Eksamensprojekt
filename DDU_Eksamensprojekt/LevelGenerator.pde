class LevelGenerator {
  int[][] mapGeneration;
  int rows = 0;
  int cols = 0;
  int tileSize=100;
  int shiftDistance=0;
  int prevShiftDistance;
  String fileName;

  LevelGenerator(String levelFileName) {
    String[] theLoadedStrings = loadStrings(levelFileName);
    fileName=levelFileName;
    cols=theLoadedStrings[1].length();
    rows=theLoadedStrings.length;
    mapGeneration =new int[cols][rows];
    println(cols);
    println(rows);

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        mapGeneration[j][i]=theLoadedStrings[i].charAt(j);
      }
    }
  }

  void drawTheLoadedMap() {
    rectangles.clear();
    rectangles.add(new Rectangle(new PVector(player1Position.x, player1Position.y), new PVector(110, 170), new PVector(player1Velocity.x, player1Velocity.y), rectangles.size(), "player1"));

    if (amountOfPlayers==2) {
      rectangles.add(new Rectangle(new PVector(player2Position.x, player2Position.y), new PVector(110, 170), new PVector(player2Velocity.x, player2Velocity.y), rectangles.size(), "player2"));
    }
    if (amountOfPlayers==3) {
      rectangles.add(new Rectangle(new PVector(player2Position.x, player2Position.y), new PVector(110, 170), new PVector(player2Velocity.x, player2Velocity.y), rectangles.size(), "player2"));
      rectangles.add(new Rectangle(new PVector(player3Position.x, player3Position.y), new PVector(110, 170), new PVector(player3Velocity.x, player3Velocity.y), rectangles.size(), "player3"));
    
  }

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (mapGeneration[j][i]=='1') {
          //PATHTILE
          if (fileName=="level1Configuration.txt") {
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "pathLevel1"));
            image(pathLevel1, (j*tileSize)+shiftDistance, i*tileSize);
          }

          if (fileName=="level2Configuration.txt") {
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "pathLevel2"));
            image(pathLevel2, (j*tileSize)+shiftDistance, i*tileSize);
          }

          if (fileName=="level3Configuration.txt") {
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "pathLevel3"));
            image(pathLevel1, (j*tileSize)+shiftDistance, i*tileSize);
          }

          if (fileName=="level4Configuration.txt") {
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "pathLevel4"));
            image(pathLevel1, (j*tileSize)+shiftDistance, i*tileSize);
          }

          if (fileName=="level5Configuration.txt") {
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "pathLevel5"));
            image(pathLevel5, (j*tileSize)+shiftDistance, i*tileSize);
          }
        }
        if (mapGeneration[j][i]=='2') {
          //FARLIG TILE
          if (fileName=="level1Configuration.txt") {
            //LAVATILE
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(100, 80), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(lavaTile, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
          if (fileName=="level2Configuration.txt") {
            //LAVATILE
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(100, 80), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(lavaTile, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
          if (fileName=="level3Configuration.txt") {
            //LAVATILE
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(100, 80), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(waterTile, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
          if (fileName=="level4Configuration.txt") {
            //WATERTILE
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(100, 80), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(waterTile, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
          if (fileName=="level5Configuration.txt") {
            //METEORTILE
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(100, 80), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(meteorTile, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
        }
        if (mapGeneration[j][i]=='3') {
          //FORHINDRING 1
          if (fileName=="level1Configuration.txt") {
            //THORN BUSH
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(thornBush, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level2Configuration.txt") {
            //smallCactus
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(smallCactus, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level3Configuration.txt") {
            //crab
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(crab, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level4Configuration.txt") {
            //hippo
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(hippo, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
          if (fileName=="level5Configuration.txt") {
            //alien1
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(alien1, (j*tileSize)+shiftDistance, i*tileSize);
          }
        }
        if (mapGeneration[j][i]=='4') {
          //FORHINDRING 2
          if (fileName=="level1Configuration.txt") {
            //FORHINDRING 2 BANE 1
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 200), new PVector(0, 0), rectangles.size(), "bigTree"));
            image(bigTree, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level2Configuration.txt") {
            //FORHINDRING 2 BANE 2
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(snake, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level3Configuration.txt") {
            //FORHINDRING 2 BANE 3
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize+20), new PVector(200, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(whale, (j*tileSize)+shiftDistance, i*tileSize+20);
          }
          if (fileName=="level4Configuration.txt") {
            //FORHINDRING 2 BANE 4
            //THORN BUSH
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(thornBush, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level5Configuration.txt") {
            //FORHINDRING 2 BANE 5
            //alien2
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 100), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(alien2, (j*tileSize)+shiftDistance, i*tileSize);
          }
        }
        if (mapGeneration[j][i]=='5') {
          //FORHINDRING 3
          if (fileName=="level1Configuration.txt") {
            //FORHINDRING 3 BANE 1
          }
          if (fileName=="level2Configuration.txt") {
            //FORHINDRING 3 BANE 2
            rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize), new PVector(100, 200), new PVector(0, 0), rectangles.size(), "dangerTile"));
            image(bigCactus, (j*tileSize)+shiftDistance, i*tileSize);
          }
          if (fileName=="level3Configuration.txt") {
            //FORHINDRING 3 BANE 3
          }
          if (fileName=="level4Configuration.txt") {
            //FORHINDRING 3 BANE 4
          }
          if (fileName=="level5Configuration.txt") {
            //FORHINDRING 3 BANE 5
          }
        }
        if (mapGeneration[j][i]=='9') {
          //FINISH
          rectangles.add(new Rectangle(new PVector((j*tileSize)+shiftDistance, i*tileSize-400), new PVector(100, 700), new PVector(0, 0), rectangles.size(), "finishline"));
          //rect((j*tileSize)+shiftDistance, i*tileSize+200, 100, 100);
          image(finishline, (j*tileSize)+shiftDistance, i*tileSize);
        }
      }
    }
  }
}
