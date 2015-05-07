import processing.video.*;

public class VideoPlayer {

  public int fps = 12;
  Movie movie;
  PVector pos;


  // Constructor 
  VideoPlayer(processing.core.PApplet parent, String path) {
    movie = new Movie(parent, path);
    this.loopVideo();
  }

  //Draw the video
  void drawVideo() {
    image(movie, this.pos.x, this.pos.y, 640, 480);
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

  void displayVideo() {
    readVideo();
    drawVideo();
  }

  void setPosition(float x, float y) {
    pos = new PVector(x, y);
  }
}

void movieEvent(Movie m) {
  m.read();
}
