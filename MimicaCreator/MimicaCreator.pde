/**
 * Interactive Installation Controller
 *
 * Created by Sandro Miccoli and Joao Pedro Schneider
 *
 * Mimica Creator
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
//String projectFolder = "C:/Users/JP/Desktop/DrawingMovie1/"; 
String projectFolder = "/Users/sandromiccoli/Dropbox/Hacklab/Processing/Sketches/projetos/mimica/Mimica/MimicaCreator/"; 

enum s {
  displayWords, 
  prepareToRecord, 
  startRecord, 
  recordVideo, 
  endRecord, 
  redoOrSubmit
}

s states;

s currentState = states.displayWords;

int fps = 12;

void setup() {
  size(640, 480);
  frameRate(fps);
  background(0);
  oscP5 = new OscP5 (this, 5001);
  myRemoteLocation = new NetAddress("127.0.0.1", 5002);

  allWords = new Words();
  allWords.setWordsFromFolder();

  createMenu();
}

void draw() {

  // State DisplayWords
  if (currentState == states.displayWords) {
    displayWords();
  }
  // State Prepare To Record
  else if (currentState == states.prepareToRecord) {
    preapareToRecord();
  }
  // State Start Record
  else if (currentState == states.startRecord) {  
    startRecording();
  }

  // State Record video 
  else if (currentState == states.recordVideo) {
    recordVideo();
  }
  // State End Record 
  else if (currentState == states.endRecord) {
    endRecording();
  }
  // State Redo, Change word or Submit 
  else if (currentState == states.redoOrSubmit) {
    redoOrSubmit();
  }
}

// Checks which word was selected
public void mouseClicked() {
  if (currentState == states.displayWords)
    selectedWord = allWords.checkMouseOver();
  else if (currentState == states.redoOrSubmit)
    menuChoice = redoOrSubmitMenu.checkMouseOver();
}
