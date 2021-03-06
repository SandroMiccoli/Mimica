

// Displays a video from the Data Base
public void displayVideoDataBase () {

  //checks for msg osc in the way 
  //change to the state "displayRecordedVideo" 
  if (messageReceive) {
    if (hasVideo) {
      movieCenter.killVideo();
      //stopMovieCorners();
      clearScreen();
      timer.start();
    }
    currentState=states[1];
    messageReceive= false;
  } else {
    //calls function that draws video to be displayed
    if (!hasVideo) {
      movieCenter = new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.getRandomVideoFromFolder()+".ogg");
      movieCenter.setSize(wMovieCenter, hMovieCenter);
      movieCenter.setPosition(xMovieCenter, yMovieCenter);      
      movieCenter.playVideo();
      //createMovieCorners();
      //playMovieCorners();
      relatedImagesScreen = new RelatedImages(50, 30, 1200, 30, 50, 610, 1200, 610); //OK
      totalImages = thisTotalImages.getTotalImages(absolutePath+wordsFolder+thisWordAndVideo.word);//OK
      sortUniqueValues(totalImages);

      println("totalImages"+ totalImages+ "    random images:"+ copyOfTheValues [0]+copyOfTheValues [1], copyOfTheValues [2], copyOfTheValues [3]);
      hasVideo = true;
    }

    movieCenter.displayVideo();
    //displayMovieCorners();


      relatedImagesScreen.loadImages( absolutePath+wordsFolder+thisWordAndVideo.word+"/", copyOfTheValues );
      relatedImagesScreen.dramImages();


    //if the timer runs out, calls another video to be displayed
    if (timer.isFinished()) {
      movieCenter.killVideo();
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
    if (hasVideo) {
      movieCenter.killVideo();
      stopMovieCorners();
      clearScreen();
      timer.start();
    }
    hasOscVideo = false;
    messageReceive= false;
  } else {

    //clear the screen
    clearScreen();

    //receive the osc video path
    if (!hasOscVideo) {
      movieCenter = new VideoPlayer(this, absolutePath + oscMessage );
      movieCenter.setSize(wMovieCenter, hMovieCenter);
      movieCenter.setPosition(xMovieCenter, yMovieCenter);      
      movieCenter.playVideo();
      thisWordAndVideo.setWord(split(oscMessage, '/')[2]); // Instead of selecting random folder, must select folder from OSC message (problably a split string will solve that)
      thisWordAndVideo.getAmountOfVideos();
      //createMovieCorners();
      relatedImagesScreen = new RelatedImages(50, 30, 1200, 30, 50, 610, 1200, 610);
      totalImages = thisTotalImages.getTotalImages(absolutePath+wordsFolder+thisWordAndVideo.word);
      sortUniqueValues(totalImages);
      println("totalImages"+ totalImages+ "    random images:"+ copyOfTheValues [0]+copyOfTheValues [1], copyOfTheValues [2], copyOfTheValues [3]);
      //playMovieCorners();
      hasOscVideo = true;
    }

    //displays the video you just recorded
    movieCenter.displayVideo();
    //displayMovieCorners();
    //OK
    //OK
 
      relatedImagesScreen.loadImages( absolutePath+wordsFolder+thisWordAndVideo.word+"/", copyOfTheValues );
      relatedImagesScreen.dramImages();
 
    //if the timer runs out, calls random video to be displayed
    if (timer.isFinished()) {
      movieCenter.killVideo();
      //stopMovieCorners();
      hasVideo = false;
      hasOscVideo = false;
      timer.start();
      currentState=states[0];
    }
  }
}

// Displays 4 random videos on each corner of the screen.
public void playMovieCorners() {

  int w = 240;
  int h = 180;

  PVector[] corners = {
    new PVector(0, 0), 
    new PVector(displayWidth-w, 0), 
    new PVector(displayWidth-w, displayHeight-h), 
    new PVector(0, displayHeight-h)
    };

    for (int i=0; i<movieCorners.size (); i++) {
      movieCorners.get(i).setSize(wMovieCorners, hMovieCorners);
      movieCorners.get(i).setPosition(corners[i].x, corners[i].y);
      movieCorners.get(i).playVideo();
    }
}

public void createMovieCorners() {
  stopMovieCorners();
  movieCorners.clear();

  for (int i=0; i<4; i++) {
    movieCorners.add(new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.getRandomVideoFromSameFolder()+".ogg"));
  }
}

public void displayMovieCorners() {
  for (VideoPlayer corner : movieCorners) {
    corner.displayVideo();
  }
}

public void stopMovieCorners() {
  for (VideoPlayer corner : movieCorners) {
    corner.killVideo();
  }
}

