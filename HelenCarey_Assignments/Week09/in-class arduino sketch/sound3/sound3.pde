// Week 05: Sound & Oscillation

//tools --> import library --> minim
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

//////////////////////
// GLOBALS
Minim minim; //create the minim object
AudioInput in;
FFT fft; /* create an FFT analyzer object, which splits up audio input into a 
spectrum of bands based on freq. (Or, technically, calculates the normalized power spectrum of an 
audio stream the moment it is queried with the analyze() method.)*/

float bandSize; //divides the width of the sketch by the # of avg'd bands in the spectrum

PImage fader; //stores screen captured images

float shrinkWidth, shrinkHeight; //used to resize screen captures for fade effect

float spSize = 5; //sparkle size


//////////////////////
// SETUP
void setup()
{
  size(1020,480);
  
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[5], 57600);
  
  arduino.pinMode(1, Arduino.INPUT);
  arduino.pinMode(9, Arduino.OUTPUT);
  
  background(0);
  fader = get(0, 0, width, height); //set up a screen capturer
  smooth();
  
  //initialize the minim object
  minim = new Minim(this); 
  
  //get audio input from internal mic. Syntax: getLineIn(type, bufferSize);
  //http://code.compartmental.net/minim/minim_method_getlinein.html
  in = minim.getLineIn(Minim.STEREO,512); //values above 512 are useless. Nyquist freq?
  
  //initialize the FFT object
  fft = new FFT(in.bufferSize(), in.sampleRate());  
  fft.logAverages(60,7); //This is necessary for an even visual display of the spectrum by octaves.
  /*Hz increase logarithmically. Don’t want to skew the visualization to the left.
  I think this fx is saying that fft.logAverages will get 60 as a min. bandwidth per octave with 
  7 bands per octave */

  bandSize = width/fft.avgSize();
  strokeWeight(bandSize);
  
  frameRate(20);
  
  shrinkWidth = width * 0.99;
  shrinkHeight = height * 0.99;
}

//////////////////////
// DRAW
void draw()
{
  fft.forward(in.mix); //mix left and right channels of audio input and perform 'forward?' fft
  
  //rect(0,0,width,height); //background
  //fill(100,1); //'fade w/ time' fill
  background(0);

  //shrink and center past screen shots 
  image(fader, (width-shrinkWidth)/2, (height - shrinkHeight)/2, shrinkWidth, shrinkHeight); 
  
  stroke(random(100,255), random(25,75), random(50,255), 255);
  
  
  //loop thru entire fft array of bands in spectrum and draw a line
  for(int i = 0; i < fft.avgSize(); i++)   {
    tint(#ffffff);
    line((i*bandSize) + (bandSize/2), height, (i*bandSize)+ (bandSize/2), height-fft.getAvg(i)*50);
    //10 is arbitrary # to ensure bands are tall enough to be seen
  }
  
  //sparkles!!! seriously, everyone loves sparkles.  
    int sensorValue = arduino.analogRead(1);
    ellipse(random(width), random(height), arduino.analogRead(1)/6, arduino.analogRead(1)/6);
    //println(sensorValue);
  
    // map the sensor values to a wide range of pitches
    float pitchVal = map(sensorValue, 0, 1024, 50, 1000);
    int pitch = int(pitchVal);
    //println(pitchVal);
    arduino.analogWrite(9, pitch);

  // wait for a moment
  delay(100);

  fader = get(0, 0, width, height); //screen capture!
}



