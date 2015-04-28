/**
 * Interactive Installation Controller
 *
 * Created by Sandro Miccoli and Joao Pedro Schneider
 *
 * Mimica Display
 *
 * Functions:
 *    - Displays content from other folder
 *    - Communicates with other sketch using OSC
 *
 */

VideoPlayer moviesSlideShow;
VideoPlayer moviesSlideShow2;
FindWordsAndVideos thisWordAndVideo;
Timer timer;

boolean messageReceive;
boolean playVideo;
boolean hasVideo;
boolean hasOscVideo;

//String absolutePath = "/Users/sandromiccoli/Dropbox/Hacklab/Processing/Sketches/projetos/mimica/Mimica/MimicaCreator/"; 
String absolutePath = "C:/Users/JP/Desktop/DrawingMovie1/"; 
String wordsFolder = "data/activeWords/";

String[] states = {
  "displayVideoDataBase", 
  "displayRecordedVideo",
};

String currentState = "displayVideoDataBase";

int fps = 12;
int timerMinutes = 60*1000; // value of the timer in minutes

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  frameRate(fps);

  hasVideo = false;
  hasOscVideo = false;
  //*******
  oscP5 = new OscP5 (this, 5002);
  myRemoteLocation = new NetAddress("127.0.0.1", 5002);
  //*******

  thisWordAndVideo = new FindWordsAndVideos();
  //Every 1 minute, the program changes the video
  timer = new Timer(1*timerMinutes);
  timer.start();
}

void draw() {
  // State DisplayWords

  if (currentState.compareTo(states[0])==0) {
    displayVideoDataBase();
  }
  // State Prepare To Record
  else if (currentState.compareTo(states[1])==0) {
    displayRecordedVideo ();
  }
}

