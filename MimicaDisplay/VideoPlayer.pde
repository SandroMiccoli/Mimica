import processing.video.*;

public class VideoPlayer {

  public int fps = 12;
  Movie movie;


  // Constructor 
  VideoPlayer(processing.core.PApplet parent, String path) {
    movie = new Movie(parent, path);
  }
  
  //Draw the video
  void drawVideo(float x, float y) {
    image(movie, x, y, 640, 480);
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
}

void movieEvent(Movie m) {
  m.read();
}

