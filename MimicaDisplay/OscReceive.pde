import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

String oscMessage;


void oscEvent(OscMessage theOscMessage) 
{  
  // get the value as a string
  oscMessage = theOscMessage.get(0).stringValue();
  messageReceive = true;

  // print out the message
  print("OSC Message Recieved: ");
  println(oscMessage );
}
