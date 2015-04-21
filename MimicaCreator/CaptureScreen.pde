// Class CaptureScreen
//
// Creates a movie file from the output of the screen

import codeanticode.gsvideo.*;

public class CaptureScreen {

  public int fps = 12;
  private String fileName;
  private String filePath;
  GSMovieMaker movie;

  // Constructor 
  CaptureScreen(processing.core.PApplet parent, String path, String f) {
    
    File folder = new java.io.File(dataPath(projectFolder+path));
    File[] folders = folder.listFiles();
    this.filePath = path;
    this.fileName = folders.length+".ogg";
    this.movie = new GSMovieMaker(parent, width, height, this.filePath+this.fileName, GSMovieMaker.THEORA, GSMovieMaker.MEDIUM, fps);
    this.movie.setQueueSize(50, 10);
  }

  // Starts recording of the movie
  void startRecording() {
    this.movie.start();
  }

  // Adds all pixels to a frame in the video
  void addPixels() {
    loadPixels();
    movie.addFrame(pixels);
  }

  // Stops recording
  void stopRecording() {
    this.movie.finish();
  }
  
  //Saves the name and the path of the video on the String
  String sendFileNameToPlay(){
    String pathAndName= this.filePath+ this.fileName;
    return pathAndName;
  }
  
  public String getFileName(){
    return this.fileName;
  }
  
  public String getFullPath(){
    return projectFolder+filePath+fileName; 
  }

  // Prints debug information
  void debug() {
    println("Number of queued frames : " + movie.getQueuedFrames());
    println("Number of dropped frames: " + movie.getDroppedFrames());
  }
}
