// Class Camera
//
// Controls camera 

//import codeanticode.gsvideo.*;

public class Camera {

  GSCapture cam;

  // Constructor
  Camera(processing.core.PApplet parent) {
    cam = new GSCapture(parent, width, height);
  }

  // Starts camera recording
  void startRecording() {   
    cam.start();
  }
  
  // Stops camera recording
  void stopRecording() {   
    cam.stop();
  }

  // Read pixes from camera and displays on screen.
  void readPixels() {
    if (cam.available() == true) {
      cam.read();
      image(cam, 0, 0);
    }
  }
}