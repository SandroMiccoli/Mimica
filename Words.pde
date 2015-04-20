// Class Words
//
// Represents words and possible interactions with them

import java.util.Hashtable;

public class Words {

  // Hashtable contains words and their position.
  private Hashtable<String, PVector> words;

  // Dimensions of word "box"
  private int letter_w = 18;
  private int word_h = 25;

  private float column = width/3;
  private float line = height/6;

  File folder;

  public String absoluteWordsFolder = projectFolder+wordsFolder;


  // Constructor
  Words() {
    this.words = new Hashtable<String, PVector>();
    ;
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

      if (i<5)
        this.words.put(folderName, new PVector(column, line*(i+1)));
      else
        this.words.put(folderName, new PVector(column*2, line*(i-5+1)));
    }

  }
  
  public void addWord(String word, PVector pos){
      this.words.put(word,pos);
  }

  // Set word style
  public void setStyle() {
    textSize(32);
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
      //fill(111,50);
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

  final FilenameFilter folderFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      if (!name.toLowerCase().startsWith("."))
        return true;
      return false;
    }
  };
}
