import oscP5.*;
import netP5.*;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;

OscP5 oscP5;
NetAddress myRemoteLocation;
String outMessage;

// Sends a message Osc with the directory and name of the video file you just saved
void oscMessageToPlay() {
  OscMessage myMessage = new OscMessage ("");
  try{
  outMessage = URLEncoder.encode(capture.sendFileNameToPlay(), "UTF-8");
  }
   catch(UnsupportedEncodingException ex)
   { 
        println(ex.getMessage());  
   }
  myMessage.add(outMessage);
  oscP5.send(myMessage, myRemoteLocation);
}
