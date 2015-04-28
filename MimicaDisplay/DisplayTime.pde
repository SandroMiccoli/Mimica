

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last


  Timer( int tempTotalTime) {
    // When the timer starts it stores the current time in milliseconds.
    totalTime = tempTotalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    // Check how much time has passed
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

