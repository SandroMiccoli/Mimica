// Interface ICamera
//
// Creates a contract for camera methods. 

public interface ICamera {

  // Starts camera recording
  void startRecording();

  // Stops camera recording
  void stopRecording();

  boolean isCapturing();

  // Read pixes from camera and displays on screen.
  void readPixels();
}
