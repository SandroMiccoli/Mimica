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

import fullscreen.*; 

SoftFullScreen fs; 

VideoPlayer movieCenter;
RelatedImages relatedImagesScreen;

ArrayList<VideoPlayer> movieCorners = new ArrayList<VideoPlayer>();
FindWordsAndVideos thisWordAndVideo;
FindImages thisTotalImages;
Timer timer;


boolean messageReceive;
boolean playVideo;
boolean hasVideo;
boolean hasOscVideo;


String absolutePath = "/Users/sandromiccoli/Dropbox/Hacklab/Processing/Sketches/projetos/mimica/Mimica/MimicaCreator/"; 
//String absolutePath = "C:/Users/JP/Desktop/DrawingMovie1/"; 
String wordsFolder = "data/activeWords/";

String[] states = {
  "displayVideoDataBase", 
  "displayRecordedVideo",
};

String currentState = "displayVideoDataBase";

int fps = 12;
int timerMinutes = 60*1000; // value of the timer in minutes
int totalImages;


int wMovieCenter = 640;
int hMovieCenter = 480;

int wMovieCorners = 240;
int hMovieCorners = 180;

int xMovieCenter ;
int yMovieCenter ;


void setup() {

   xMovieCenter = displayWidth/2-wMovieCenter/2;
   yMovieCenter = displayHeight/2-hMovieCenter/2;

 

  size(3280, 768);
  // Create the fullscreen object
  fs = new SoftFullScreen(this); 

  //fs.setShortcutsEnabled(true);
  // enter fullscreen mode
  fs.enter(); 



  frameRate(fps);

  hasVideo = false;
  hasOscVideo = false;
  //*******
  oscP5 = new OscP5 (this, 5002);
  myRemoteLocation = new NetAddress("127.0.0.1", 5002);
  //*******

  thisWordAndVideo = new FindWordsAndVideos();
  thisTotalImages = new FindImages();
  //Every 1 minute, the program changes the video
  timer = new Timer(1*timerMinutes);
  timer.start();
}

void draw() {
  // State DisplayWords
  background(0);

  if (currentState.compareTo(states[0])==0) {
    displayVideoDataBase();
  }
  // State Prepare To Record
  else if (currentState.compareTo(states[1])==0) {
    displayRecordedVideo ();
  }
}
