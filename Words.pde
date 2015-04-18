import java.util.Hashtable;

public class Words{
  
  // Hashtable contains words and their position.
  Hashtable<String, PVector> words;
  
  // Dimensions of word "box"
  int word_w = 100;
  int word_h = 25;
  
  float column = width/3;
  float line = height/6;
  
  // Constructor
  Words(){
    this.words = new Hashtable<String, PVector>();;
  }
  
  // Sets all words
  public void setWords(){
      this.words.put("zero",new PVector(column,line));
      this.words.put("um",new PVector(column,line*2));
      this.words.put("dois",new PVector(column,line*3));
      this.words.put("tres",new PVector(column,line*4));
      this.words.put("quatro",new PVector(column,line*5));
      this.words.put("cinco",new PVector(column*2,line*1));
      this.words.put("seis",new PVector(column*2,line*2));
      this.words.put("sete",new PVector(column*2,line*3));
      this.words.put("oito",new PVector(column*2,line*4));
      this.words.put("nove",new PVector(column*2,line*5));
  }
  
  // Set word style
  public void setStyle(){
      textSize(32);
      fill(0, 102, 153, 204);  
  }
  
  // Draw words on screen
  public void drawWords(){
    PVector pos;
    rectMode(CORNERS);
    for (String word : this.words.keySet()) {
        pos = this.words.get(word);
        
        // Draw rect to view where mouse needs to click
        //stroke(0);
        //fill(111,50);
        //rect(pos.x,pos.y-word_h,pos.x+word_w,pos.y);
        
        fill(0);
        text(word,pos.x,pos.y);
    }
  }
  
  public void checkMouseOver(){
     
    PVector pos;
    for (String word : this.words.keySet()) {
      pos = this.words.get(word);
        if (mouseX>pos.x && mouseX<pos.x+word_w && mouseY>pos.y-word_h && mouseY<pos.y){
            println(word);
        }
      
    }
  }
  
}
