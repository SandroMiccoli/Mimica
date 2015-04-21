
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
  capture = new CaptureScreen(this, wordsFolder+selectedWord+"/", selectedWord);
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
  currentState=states[5];
}

public void redoOrSubmit() {
  redoOrSubmitMenu.drawWords();

  if (menuChoice.compareTo("Gravar novamente")==0) {
    clearScreen();
    deleteFile(capture.getFullPath());
    menuChoice="";
    currentState=states[1];
  } else if (menuChoice.compareTo("Trocar palavra")==0) {
    clearScreen();
    deleteFile(capture.getFullPath());
    selectedWord="";
    menuChoice="";
    currentState=states[0];
  } else if (menuChoice.compareTo("Enviar vídeo")==0) {
    clearScreen();
    selectedWord="";
    menuChoice="";  
    currentState=states[0];
    // Sends the Osc Message
    oscMessageToPlay();
  }
}

public void createMenu() {
  redoOrSubmitMenu = new Words();
  redoOrSubmitMenu.addWord("Gravar novamente", new PVector(150, 100));
  redoOrSubmitMenu.addWord("Trocar palavra", new PVector(150, 200));
  redoOrSubmitMenu.addWord("Enviar vídeo", new PVector(150, 300));
}
