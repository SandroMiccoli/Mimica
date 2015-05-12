public class RelatedImages {
  int [] x = new int[4];
  int [] y = new int[4];
  int t;
  PImage [] imgsScreen = new PImage[4];


  RelatedImages(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) {
    //t = 130;
     t = 230;
    x[0] = x1;
    x[1] = x2;
    x[2] = x3;
    x[3] = x4;

    y[0] = y1;
    y[1] = y2;
    y[2] = y3;
    y[3] = y4;
  } 

  void loadImages( String imgPath ) {
    //get the first 4 imagens 
    for (int i = 0; i<4; i ++) {
      imgsScreen[i] = loadImage(imgPath+i+".png");
    }
  }


  void dramImages() {
    for (int i = 0; i<4; i ++) {
      image( imgsScreen[i], x[i], y[i], t, t);
    }
  }
}
