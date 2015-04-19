// Class Words
//
// Represents words and possible interactions with them

import java.util.Hashtable;

public class Words {

  // Hashtable contains words and their position.
  private Hashtable<String, PVector> words;

  // Dimensions of word "box"
  private int word_w = 100;
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
  public void setWords() {

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

    /*
    this.words.put("zero", new PVector(column, line));
     this.words.put("um", new PVector(column, line*2));
     this.words.put("dois", new PVector(column, line*3));
     this.words.put("tres", new PVector(column, line*4));
     this.words.put("quatro", new PVector(column, line*5));
     this.words.put("cinco", new PVector(column*2, line*1));
     this.words.put("seis", new PVector(column*2, line*2));
     this.words.put("sete", new PVector(column*2, line*3));
     this.words.put("oito", new PVector(column*2, line*4));
     this.words.put("nove", new PVector(column*2, line*5));
     */
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
      //rect(pos.x,pos.y-word_h,pos.x+word_w,pos.y);

      text(word, pos.x, pos.y);
    }
  }

  public String checkMouseOver() {

    PVector pos;
    for (String word : this.words.keySet ()) {
      pos = this.words.get(word);
      if (mouseX>pos.x && mouseX<pos.x+word_w && mouseY>pos.y-word_h && mouseY<pos.y) {
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
