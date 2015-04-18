// Class CaptureScreen
//
// Creates a movie file from the output of the screen

import codeanticode.gsvideo.*;

public class CaptureScreen {

  public int fps = 12;
  private String fileName;

  GSMovieMaker movie;

  // Constructor 
  CaptureScreen(processing.core.PApplet parent, String f) {
    fileName = f;
    movie = new GSMovieMaker(parent, width, height, fileName, GSMovieMaker.THEORA, GSMovieMaker.MEDIUM, fps);
    movie.setQueueSize(50, 10);
  }

  // Starts recording of the movie
  void startRecording() {
    movie.start();
  }

  // Adds all pixels to a frame in the video
  void addPixels() {
    loadPixels();
    movie.addFrame(pixels);
  }

  // Stops recording
  void stopRecording() {
    movie.finish();
  }

  // Prints debug information
  void debug() {
    println("Number of queued frames : " + movie.getQueuedFrames());
    println("Number of dropped frames: " + movie.getDroppedFrames());
  }
}
