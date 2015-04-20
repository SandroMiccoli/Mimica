/**
 * Interactive Installation Controller
 *
 * Created by Sandro Miccoli and Joao Pedro Schneider
 *
 * Functions:
 *    - Capture image from camera, Kinect or PS3 camera.
 *    - Create a video from screen output.
 *    - Draw counter in a pie format.
 *    - Draw words
 *    - Checks if mouse clicks over a word
 *    - Changes from state to state
 *
 */

import java.io.FilenameFilter;

Camera cam;
CaptureScreen capture;
CountDownPie pie;
Words allWords;
String selectedWord="";

Words redoOrSubmitMenu;
String menuChoice="";

String wordsFolder = "data/activeWords/";
String projectFolder = "/Users/sandromiccoli/Dropbox/Hacklab/Processing/Sketches/projetos/mimica/Mimica/"; 

String[] states = {
                    "displayWords", 
                    "preapareToRecord", 
                    "startRecord", 
                    "recordVideo", 
                    "endRecord", 
                    "redoOrSubmit"
                  };
String currentState = "displayWords";

int fps = 12;

void setup() {
  size(640, 480);
  frameRate(fps);
  background(0);

  allWords = new Words();
  allWords.setWordsFromFolder();
  
  createMenu();

}

void draw() {

  // State DisplayWords
  if (currentState.compareTo(states[0])==0) {
    displayWords();
  }
  // State Prepare To Record
  else if (currentState.compareTo(states[1])==0) {
    preapareToRecord();
  }
  // State Start Record
  else if (currentState.compareTo(states[2])==0) {  
    startRecording();
  }

  // State Record video 
  else if (currentState.compareTo(states[3])==0) {
    recordVideo();
  }
  // State End Record 
  else if (currentState.compareTo(states[4])==0) {
    endRecording();
  }
  // State Redo, Change word or Submit 
  else if (currentState.compareTo(states[5])==0) {
    redoOrSubmit();
  }
}

// Checks which word was selected
public void mouseClicked() {
  if (currentState.compareTo(states[0])==0)
    selectedWord = allWords.checkMouseOver();
  else if (currentState.compareTo(states[5])==0)
    menuChoice = redoOrSubmitMenu.checkMouseOver();
  
}


final FilenameFilter jpgFilter = new FilenameFilter() {
  boolean accept(File dir, String name) {
    return name.toLowerCase().endsWith(".jpg");
  }
};
