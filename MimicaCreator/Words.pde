// Class Words
//
// Represents words and possible interactions with them

import java.util.Hashtable;

public class Words {

  // Hashtable contains words and their position.
  private Hashtable<String, PVector> words;

  // Dimensions of word "box"
  private int letter_w = 25;
  private int word_h = 35;

  private float column = width/3;
  private float line = height/6;

  private PVector[] pos = new PVector[10];

  private File folder;

  private String absoluteWordsFolder = projectFolder+wordsFolder;

  private PFont myFont;
  private int fontSize=21;
  
  // Constructor
  Words(String f, int s) {
    this.words = new Hashtable<String, PVector>();
    setWordPositions();
    setFontSize(s);
    setFont(f);
  }

  // Searches for folders in the Words folder.
  // Each folder represents a word.
  public void setWordsFromFolder() {

    folder = new java.io.File(dataPath(absoluteWordsFolder));
    File[] folders = folder.listFiles(folderFilter);

    // Busca apenas as primeiras 10 palavras
    for (int i=0; i<folders.length && i<10; i++) {

      // Capitalize first letter in string
      String folderName = folders[i].getName().substring(0, 1).toUpperCase() + folders[i].getName().substring(1);
     this.words.put(folderName, pos[i]);
    }
  }

  // Set Word Positions manually for more control
  public void setWordPositions() {
    this.pos[0] = new PVector(10.0+random(0,70), 80.0);
    this.pos[1] = new PVector(10.0+random(0,70), 160.0);
    this.pos[2] = new PVector(10.0+random(0,70), 240.0);
    this.pos[3] = new PVector(10.0+random(0,70), 320.0);
    this.pos[4] = new PVector(10.0+random(0,70), 400.0);
    this.pos[5] = new PVector(360-random(0,40), 80.0);
    this.pos[6] = new PVector(360-random(0,40), 160.0);
    this.pos[7] = new PVector(360-random(0,40), 240.0);
    this.pos[8] = new PVector(360-random(0,40), 320.0);
    this.pos[9] = new PVector(360-random(0,40), 400.0);
  }

  public void addWord(String word, PVector pos) {
    this.words.put(word, pos);
  }

  // Set word style
  public void setStyle() {
    textFont(this.myFont, this.fontSize);
    textSize(this.fontSize);
    fill(#F0F0F0);
  }

  // Draw words on screen
  public void drawWords() {
    this.setStyle();
    PVector pos;
    rectMode(CORNERS);
    for (String word : this.words.keySet ()) {
      pos = this.words.get(word);

      // Draw rect to view where mouse needs to click
      //stroke(0);
      //fill(111,10);
      //rect(pos.x,pos.y-word_h,pos.x+letter_w*word.length(),pos.y);

      text(word, pos.x, pos.y);
    }
  }

  public String checkMouseOver() {

    PVector pos;
    for (String word : this.words.keySet ()) {
      pos = this.words.get(word);
      if (mouseX>pos.x && mouseX<pos.x+letter_w*word.length() && mouseY>pos.y-word_h && mouseY<pos.y) {
        return word;
      }
    }
    return ""; // no word selected
  }
  
  public String chooseRandomWord(){
    int r = int(random(0,10));
    int i = 0;
    for (String word : this.words.keySet ()) {
      if (r==i)
        return word;
      i++;
    }
    return "";
  }
  
  public void setFont(String f){
    this.myFont = createFont("fonts/"+f, this.fontSize);
  }
  
  public void setFontSize(int s){
    this.fontSize = s;  
  }

  final FilenameFilter folderFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      if (!name.toLowerCase().startsWith("."))
        return true;
      return false;
    }
  };
}
