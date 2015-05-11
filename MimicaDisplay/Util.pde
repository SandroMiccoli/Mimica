void clearScreen() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    pixels[i] = color(0);
  }
  updatePixels();
}

void sortUniqueValues(int maximumValue, int [] copyOfTheValues) {

  int [] checkedValues = new int [maximumValue];// marca qual numero ja foi sorteado
  int raffledValue; //valor sorteado 
  int totalDrawnValues = 0; //contador de slots preenchidos  

  do {
    //sorteia um número
    raffledValue = int(random (0, maximumValue));
    // println("imagem sorteada: " +qualImg);
    //se o numero ainda nao foi sorteado parte para sortear o do proximo slot
    if (checkedValues[raffledValue]==0) {
      checkedValues[raffledValue] = 1;

      totalDrawnValues++;

      //copia o valor sorteado em uma variavel auxiliar 
      copyOfTheValues[maximumValue-1] = raffledValue;
    }
  } 
  while (totalDrawnValues<4);
}


void mouseDragged() {

  //moves the movieCenter with the mouse dragged
  if (mousePressed&&movieCenter.calcMouseIn()) {
    xMovieCenter = mouseX-wMovieCenter/2;
    yMovieCenter = mouseY-hMovieCenter/2;

    movieCenter.setPosition(xMovieCenter, yMovieCenter);
  }

  //moves the selected movieCorner with the mouse dragged
  for (int i=0; i<movieCorners.size (); i++) {

    if (mousePressed&& movieCorners.get(i).calcMouseIn()) {

      movieCorners.get(i).setPosition(mouseX-wMovieCorners/2, mouseY-hMovieCorners/2);
    }
  }
}

void keyPressed() {
  movieCenter.setSize( wMovieCenter, hMovieCenter);

  for (int i=0; i<movieCorners.size (); i++) {
    movieCorners.get(i).setSize(  wMovieCorners, hMovieCorners);
  }

  if (key=='q') {// decrease the size of movieCenter

    wMovieCenter = wMovieCenter -10; 
    hMovieCenter = hMovieCenter -10;
  }
  if (key=='w') {// raise the size of movieCenter

    wMovieCenter = wMovieCenter +10; 
    hMovieCenter = hMovieCenter +10;
  }
  if (key=='a') {// decrease the size of movieCenter

    wMovieCorners = wMovieCorners -10; 
    hMovieCorners = hMovieCorners -10;
  }

  if (key=='s') {// decrease the size of movieCenter

    wMovieCorners = wMovieCorners +10; 
    hMovieCorners = hMovieCorners +10;
  }

  if (key=='p') {
      println("*********MOVIES PROPETIES**********");
    println(  "MovieCenter position: " + xMovieCenter+","+ yMovieCenter);
    println("MovieCenter sizes: " +   wMovieCenter +","+   hMovieCenter);
    println(  "MovieCorners 1 position: "+ int(movieCorners.get(0).pos.x)+"," +int(movieCorners.get(0).pos.y));
    println(  "MovieCorners 2 position: "+ int(movieCorners.get(1).pos.x)+"," +int(movieCorners.get(1).pos.y));
    println(  "MovieCorners 3 position: "+ int(movieCorners.get(2).pos.x)+"," +int(movieCorners.get(2).pos.y));
    println(  "MovieCorners 4 position: "+ int(movieCorners.get(3).pos.x)+"," +int(movieCorners.get(3).pos.y));
    println("MovieCorners sizes: " +   wMovieCorners +","+   hMovieCorners);
      println("***********************************");
  }
}

