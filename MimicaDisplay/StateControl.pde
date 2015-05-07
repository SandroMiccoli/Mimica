

// Displays a video from the Data Base
public void displayVideoDataBase () {

  //checks for msg osc in the way 
  //change to the state "displayRecordedVideo" 
  if (messageReceive) {
    if (hasVideo)
      movieCenter.stopVideo();
    currentState=states[1];
    messageReceive= false;
  } else {
    //calls function that draws video to be displayed
    if (!hasVideo) {
      movieCenter = new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.getVideoFromFolder()+".ogg");
      movieCenter.setPosition(displayWidth/2-320, displayHeight/2-240);      
      movieCenter.playVideo();
      hasVideo = true;
    }

    movieCenter.displayVideo();
    displayRandomVideos();

    //if the timer runs out, calls another video to be displayed
    if (timer.isFinished()) {
      movieCenter.stopVideo();
      hasVideo = false;
      timer.start();
    }
  }
}

// Displays the video you just recorded
public void displayRecordedVideo () {

  //checks for msg osc in the way 
  if (messageReceive) {
    if (hasVideo)
      movieCenter.stopVideo();
    hasOscVideo = false;
    messageReceive= false;
  } else {

    //clear the screen
    clearScreen();
    
    //receive the osc video path
    if (!hasOscVideo) {
      movieCenter = new VideoPlayer(this, absolutePath + oscMessage );
      movieCenter.setPosition(displayWidth/2-320, displayHeight/2-240);      
      movieCenter.playVideo();
      hasOscVideo = true;
    }

    //displays the video you just recorded
    movieCenter.displayVideo();

    //if the timer runs out, calls random video to be displayed
    if (timer.isFinished()) {
      movieCenter.stopVideo();
      hasVideo = false;
      hasOscVideo = false;
      timer.start();
      currentState=states[0];
    }
  }
}
