
// KINECT INTERFACE
import SimpleOpenNI.*;

public class Kinect implements ICamera {

  SimpleOpenNI simpleOpenNI;

  PImage maskImage;
  PImage rgbImage;
  // KINECT DEPTH VALUES
  int[] depthValues;

  // RADIUS FOR BLUR (PIXELS)
  int currentRadius = 3;

  // DISTANCE RANGE IN MILLIMETERS (FOR THE FILTER)
  int minDistance  = 500;  // 50cm
  int maxDistance  = 1500; // 1.5m

  public Kinect(processing.core.PApplet parent)
  {
    simpleOpenNI = new SimpleOpenNI(parent);
  }

  // Starts camera recording
  void startRecording() {

    simpleOpenNI.setMirror(true);

    if (simpleOpenNI.enableDepth() == false) { 
      println("Can't open the depthMap, maybe the Kinect is not connected!"); 
      exit();
      return;
    }

    if (simpleOpenNI.enableRGB() == false) { 
      println("Can't open the Kinect cam, maybe the Kinect is not connected!"); 
      exit();
      return;
    }

    simpleOpenNI.alternativeViewPointDepthToImage();

    maskImage  = createImage(width, height, RGB);
  }

  // Stops camera recording
  void stopRecording() {
    simpleOpenNI.dispose();
  }

  boolean isCapturing() {
    return true; // Gambis (;
  }

  // Read pixes from camera and displays on screen.
  void readPixels() {
    clearScreen();
    simpleOpenNI.update();


    maskImage.loadPixels();
    createsMask();
    maskImage.updatePixels();

    rgbImage = simpleOpenNI.rgbImage();
    rgbImage.mask(maskImage);

    // COMPENSATE FOR alternativeViewPointDepthToImage
    image(rgbImage, -50, -50, width+50, height+50);
  }
  
  void createsMask(){
    depthValues = simpleOpenNI.depthMap();
    for (int pic = 0; pic < depthValues.length; pic++)
      if (depthValues[pic] > minDistance && depthValues[pic] < maxDistance)
        // IN RANGE: WHITE PIXEL
        maskImage.pixels[pic] = color(255);
      else
        maskImage.pixels[pic] = color(0);
  }
}
