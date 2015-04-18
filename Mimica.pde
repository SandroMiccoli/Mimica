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
 *
 */

Camera cam;
CaptureScreen capture;
CountDownPie pie;
Words allWords;

void setup() {
  size(640, 480);

  capture = new CaptureScreen(this, "novovideo.ogg");
  cam = new Camera(this);
  frameRate(capture.fps);

  cam.startRecording();
  //capture.startRecording();

  pie = new CountDownPie(width-100, 100, 50, 50, 8);
  allWords = new Words();
  allWords.setWords();
  allWords.setStyle();
}

void draw() {
  cam.readPixels();
  //capture.addPixels();
  pie.drawPie();
  allWords.drawWords();
}


void keyPressed() {
  if (key == ' ') {
    capture.stopRecording();
    // Quit running the sketch
    exit();
  }
}


public void mouseClicked() {
  allWords.checkMouseOver();
}
