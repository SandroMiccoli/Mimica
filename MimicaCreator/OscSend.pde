import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

// Sends a message Osc with the directory and name of the video file you just saved
void oscMessageToPlay() {
  OscMessage myMessage = new OscMessage ("");
  myMessage.add(capture.sendFileNameToPlay());
  oscP5.send(myMessage, myRemoteLocation);
}
