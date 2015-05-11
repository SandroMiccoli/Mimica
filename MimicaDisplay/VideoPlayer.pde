import processing.video.*;

public class VideoPlayer {

  public int fps = 12;
  Movie movie;
  private PVector pos;
  private int w;
  private int h;



  // Constructor 
  VideoPlayer(processing.core.PApplet parent, String path) {
    movie = new Movie(parent, path);
    this.loopVideo();
  }

  //Draw the video
  void drawVideo() {
 
    image(movie, this.pos.x, this.pos.y, this.w, this.h);
  }

  // Read video 
  void readVideo() {
    if (movie.available() == true) {
      movie.read();
    }
  }

  //Loop video
  void loopVideo() {
    movie.loop();
  }

  // Play video
  void playVideo() {
    movie.play();
  }

  // Stop video
  void stopVideo() {
    movie.stop();
  }
  
  void killVideo(){
    movie.dispose(); 
  }

  void displayVideo() {
    readVideo();
    drawVideo();
  }

  void setPosition(float x, float y) {
    this.pos = new PVector(x, y);
  }

  void setSize(int w, int h) {
    this.w = w;
    this.h = h;
  }
  
   boolean calcMouseIn(){
    if(mouseX>this.pos.x && mouseX< this.pos.x+this.w && mouseY>this.pos.y && mouseY<this.pos.y +this.h){
      return true;
  }
  else{
  return false;
  }
  
}

}

void movieEvent(Movie m) {
  m.read();
}
