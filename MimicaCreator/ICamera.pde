// Class Camera
//
// Controls camera 

//import codeanticode.gsvideo.*;

public interface ICamera {

  // Starts camera recording
  void startRecording();

  // Stops camera recording
  void stopRecording();

  boolean isCapturing();

  // Read pixes from camera and displays on screen.
  void readPixels();
}
