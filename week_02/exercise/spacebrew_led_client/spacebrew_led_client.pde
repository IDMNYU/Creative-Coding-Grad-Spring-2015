/*
 * Button Example
 *   to test go to: http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc
 *   Spacebrew library button example that send and receives boolean messages.  
 * 
 */
import spacebrew.*;
import processing.serial.*;
Serial myPort; 
boolean firstContact = false;
boolean isWaiting = true; //waiting for a boolean message

String server="sandbox.spacebrew.cc";
String name="CC LED";
String description ="Client that receives boolean messages. Background turns yellow when message received.";

Spacebrew sb;

color color_on = color(255, 255, 50);
color color_off = color(255, 255, 255);
int currentColor = color_off;

void setup() {
  frameRate(240);
  size(500, 400);

  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );

  // declare your subscribers
  sb.addSubscribe( "light_LED", "boolean" );

  // connect to spacebrew
  sb.connect(server, name, description );

  //SERIAL WITH ARDUINO
  println(Serial.list()); //print out all the serial ports
  String portName = Serial.list()[5]; //ensure this port # matches that of arduino!
  myPort = new Serial(this, portName, 9600);
      
}

void draw() {
  // set background color
  background( currentColor );

  // draw button
  fill(255,0,0);
  stroke(200,0,0);
  rectMode(CENTER);
  ellipse(width/2,height/2,250,250);

  // add text to button
  fill(230);
  textAlign(CENTER);
  textSize(24);
  if (isWaiting) {
    text("Waiting...", width/2, height/2 + 12);
  } else {
    text("That Feels Good", width/2, height/2 + 12);
  }
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message " + name + " : " + value); 

  // update background color
  if (value == true) {
    currentColor = color_on;
    isWaiting = false;
    myPort.write('A');
  } else {
    currentColor = color_off;
    myPort.write('B');
    isWaiting = true;
  }
}

void serialEvent(Serial myPort) {
  
  if(myPort.available()>0){
    
    int inByte = myPort.read(); //read one byte from serial
  
    if (firstContact == false) { 
      if (inByte == 'A') { 
        myPort.clear();          
        firstContact = true;     
        myPort.write('A');  
      } 
    }else{
      myPort.write('m'); //request more data
    } 
  }
}
