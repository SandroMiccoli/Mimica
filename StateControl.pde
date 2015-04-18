
// Displays all words and waits for a word to be selected
public void displayWords() {
  allWords.drawWords();
  // Checks if a word was selected
  if (selectedWord.compareTo("")!=0) {
    clearScreen();

    pie = new CountDownPie(width/2, height/2, width/2, width/2, 5);

    println(selectedWord);
    
    currentState=states[1];
  }
}

// Runs a timer before recording
public void preapareToRecord() {
  pie.drawPie();
  if (pie.endOfCountDown()) {
    pie = new CountDownPie(width-100, 100, 150, 150, 15);
    currentState=states[2];
  }
}

// Starts recording
public void startRecording() {
  clearScreen();
  cam = new Camera(this);
  cam.startRecording(); 
  capture = new CaptureScreen(this, path+selectedWord+"/"+selectedWord+".ogg");
  capture.startRecording();
  currentState=states[3];
}

// Records Video
public void recordVideo() {
  cam.readPixels();
  capture.addPixels();
  pie.drawPie();

  if (pie.endOfCountDown()) {
    currentState=states[4];
  }
}

// Ends recording of video
public void endRecording() {
  cam.stopRecording();
  capture.stopRecording();
  clearScreen();
  selectedWord="";
  currentState=states[0];
}
