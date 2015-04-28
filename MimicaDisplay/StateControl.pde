

// Displays a video from the Data Base
public void displayVideoDataBase () {

  //checks for msg osc in the way 
  //change to the state "displayRecordedVideo" 
  if (messageReceive) {
    currentState=states[1];
    messageReceive= false;
  } else {
    //calls function that draws video to be displayed
    if (!hasVideo) {
      moviesSlideShow = new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.setWordsFromFolder()+".ogg");
      hasVideo = true;
    }

    //displays the video

    //println("iniciou o tempo");
    moviesSlideShow.readVideo();
    moviesSlideShow.loopVideo();
    moviesSlideShow.drawVideo(displayWidth/2-320, displayHeight/2-240);

    //if the timer runs out, calls another video to be displayed
    if (timer.isFinished()) {
      hasVideo = false;
      timer.start();
    }
  }
}

// Displays the video you just recorded
public void displayRecordedVideo () {

  //checks for msg osc in the way 
  if (messageReceive) {
    hasOscVideo = false;
    messageReceive= false;
  } else {


    //clear the screen
    clearScreen();
    
    //receive the osc video path
    if (!hasOscVideo) {
      moviesSlideShow2 = new VideoPlayer(this, absolutePath + oscMessage );
      hasOscVideo = true;
    }

    //displays the video you just recorded
    moviesSlideShow2.readVideo();
    moviesSlideShow2.loopVideo();
    moviesSlideShow2.drawVideo(displayWidth/2-320, displayHeight/2-240);




    //if the timer runs out, calls another video to be displayed
    if (timer.isFinished()) {
      hasVideo = false;
      hasOscVideo = false;
      timer.start();
      currentState=states[0];
    }
  }
}

