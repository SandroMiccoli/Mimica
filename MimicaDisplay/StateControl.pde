

// Displays a video from the Data Base
public void displayVideoDataBase () {
  //verifica se existe msg osc a caminho *


  if (messageReceive) {
    currentState=states[1];
    messageReceive= false;
  } else {

    //chama função que sorteia video pra ser exibido
    if (!hasVideo) {
      moviesSlideShow = new VideoPlayer(this, absolutePath+wordsFolder+thisWordAndVideo.setWordsFromFolder()+".ogg");
      hasVideo = true;
    }

    //exibe o video

    moviesSlideShow.readVideo();
    moviesSlideShow.loopVideo();
    moviesSlideShow.drawVideo(displayWidth/2-320, displayHeight/2-240);


    // se passar o tempo do timer ***

    //chama função que sorteia video pra ser exibido ***
    //exibe o video ***
  }
}

// Displays the video you just recorded
public void displayRecordedVideo () {
  // se recebeu uma msg osc

  if (messageReceive) {
    hasOscVideo = false;
    messageReceive= false;
  } else {
    //verifica se esta sendo exibido um video ***
    //limpa a tela
    clearScreen();

    if (!hasOscVideo) {
      moviesSlideShow2 = new VideoPlayer(this, absolutePath + oscMessage );
      hasOscVideo = true;
    }

    // exibe o video recebido
    moviesSlideShow2.readVideo();
    moviesSlideShow2.loopVideo();
    moviesSlideShow2.drawVideo(displayWidth/2-320, displayHeight/2-240);



    //se passar o timer 
    //exibe um video do banco de dados
  }
}

