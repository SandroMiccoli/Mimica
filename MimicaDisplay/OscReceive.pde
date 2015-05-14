import oscP5.*;
import netP5.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;

OscP5 oscP5;
NetAddress myRemoteLocation;

String oscMessage;



void oscEvent(OscMessage theOscMessage) 
{  
  try {
    // get the value as a string
    oscMessage = URLDecoder.decode(theOscMessage.get(0).stringValue(), "UTF-8"); // Test for Windows
    println("Message received: "+theOscMessage.get(0).stringValue());
    println("Received decoded: "+oscMessage);
  }

  catch(UnsupportedEncodingException ex)
  { 
    println(ex.getMessage());
  }
  messageReceive = true;

  // print out the message
  print("OSC Message Recieved: ");
  println(oscMessage );
}
