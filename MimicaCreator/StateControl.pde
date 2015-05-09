
// Displays all words and waits for a word to be selected
public void displayWords() {
  allWords.drawWords();
  // Checks if a word was selected
  if (selectedWord.compareTo("")!=0) {
    clearScreen();

    pie = new CountDownPie(width/2, height/2, width/2, width/2, 5);

    println("Palavra selecionada: "+selectedWord);

    currentState=states.prepareToRecord;
  }
}

// Runs a timer before recording
public void preapareToRecord() {

  if (pie.startOfCountDown()) {
    if (camOrKinect)
      cam = new Camera(this);
    else
      if (flagKinect) {
      cam = new Kinect(this);
      flagKinect = false;
    } else {
    }
    cam.startRecording();
  }

  pie.drawPie();

  if (pie.endOfCountDown()) {
    pie = new CountDownPie(width-100, 100, 150, 150, 15);
    currentState=states.startRecord;
  }
}

// Starts recording
public void startRecording() {
  clearScreen();
  if (cam.isCapturing()) {
    capture = new CaptureScreen(this, wordsFolder+selectedWord+"/", selectedWord);
    capture.startRecording();
    currentState=states.recordVideo;
  }
}

// Records Video
public void recordVideo() {
  cam.readPixels();
  capture.addPixels();
  pie.drawPie();

  if (pie.endOfCountDown()) {
    currentState=states.endRecord;
  }
}

// Ends recording of video
public void endRecording() {
  cam.stopRecording();
  capture.stopRecording();


  clearScreen();
  currentState=states.redoOrSubmit;
}

public void redoOrSubmit() {
  redoOrSubmitMenu.drawWords();

  if (menuChoice.compareTo("Gravar novamente")==0) {
    clearScreen();
    deleteFile(capture.getFullPath());
    menuChoice="";
    currentState=states.prepareToRecord;
  } else if (menuChoice.compareTo("Trocar palavra")==0) {
    clearScreen();
    deleteFile(capture.getFullPath());
    selectedWord="";
    menuChoice="";
    currentState=states.displayWords;
  } else if (menuChoice.compareTo("Enviar vídeo")==0) {
    clearScreen();
    selectedWord="";
    menuChoice="";  
    currentState=states.displayWords;
    // Sends the Osc Message
    oscMessageToPlay();
  }
}

public void createMenu() {
  redoOrSubmitMenu = new Words("Gotham-Light.otf",40);
  redoOrSubmitMenu.addWord("Gravar novamente", new PVector(150, 100));
  redoOrSubmitMenu.addWord("Trocar palavra", new PVector(150, 250));
  redoOrSubmitMenu.addWord("Enviar vídeo", new PVector(150, 400));
}
