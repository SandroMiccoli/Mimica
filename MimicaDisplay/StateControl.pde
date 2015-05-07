

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
      movieCenter = new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.getRandomVideoFromFolder()+".ogg");
      movieCenter.setSize(640,480);
      movieCenter.setPosition(displayWidth/2-320, displayHeight/2-240);      
      movieCenter.playVideo();
      createMovieCorners();
      playMovieCorners();
      hasVideo = true;
    }

    movieCenter.displayVideo();
    displayMovieCorners();

    //if the timer runs out, calls another video to be displayed
    if (timer.isFinished()) {
      movieCenter.stopVideo();
      stopMovieCorners();
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

// Displays 4 random videos on each corner of the screen.
public void playMovieCorners(){
  PVector[] corners = {
                      new PVector(0,0),
                      new PVector(displayWidth-160,0),
                      new PVector(displayWidth-160,displayHeight-160),
                      new PVector(0,displayHeight-160)
                      };
  
  for (int i=0; i<movieCorners.size(); i++){
    movieCorners.get(i).setSize(160,120);
    movieCorners.get(i).setPosition(corners[i].x,corners[i].y);
    movieCorners.get(i).playVideo();
    
  }
  
}

public void createMovieCorners(){
  movieCorners.clear();
  for (int i=0; i<4; i++){
    movieCorners.add(new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.getRandomVideoFromSameFolder()+".ogg"));
  }
}

public void displayMovieCorners(){
  for (VideoPlayer corner : movieCorners) {
      corner.displayVideo();
    }
}

public void stopMovieCorners(){
  for (VideoPlayer corner : movieCorners) {
      corner.stopVideo();
    }
  
}
