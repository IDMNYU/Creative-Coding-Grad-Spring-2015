/**
  * additive_synthesis.pde
  * based on the Synthesize Sound example in Examples...->Libraries->minim->SynthesizeSound.pde
  * Modifications to original example by Kevin Siwoff 2/22/15
  * 
  * This sketch demonstrates how to create additive synthesis with Minim 
  * using an AudioOutput and Oscil. An Oscil is a UGen object, 
  * one of many different types included with Minim. By using 
  * the numbers 1 thru 5, you can change the waveform being used
  * by the Oscil to make sound. These basic waveforms are the 
  * basis of much audio synthesis. 
  * 
  * For many more examples of UGens included with Minim, 
  * have a look in the Synthesis folder of the Minim examples.
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */
  
//when we work with libraries in Processing, 
//we need to import them by calling import
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;//reference to the Minim Object
AudioOutput out; //reference to our AudioOutput object
Oscil       wave;
Summer      sum; // This node sums multiple signals together
//This is a dynamically sized Array holding reference to many wave objects
ArrayList<Oscil> waves; 

String      additiveExpr = "";//holds our expression to evaluate

boolean blinkCursor = true;//boolean that gets flipped on and off each second

void setup()
{
  //create a canvas the size of our display
  size(displayWidth/2, displayHeight/2);
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // create an initial sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  
  waves = new ArrayList<Oscil>();
  
  sum = new Summer(); //create a new Summer object
  
  // patch the Oscil to the summer output
  wave.patch(sum);
  sum.patch(out);//then patch the output of our summer to Audio out
}

void draw()
{
  background(0);
  stroke(255);
  strokeWeight(1);
  
  pushMatrix();
    translate(width/2 - out.bufferSize() / 2, 0);
    // draw the waveform of the output
    for(int i = 0; i < out.bufferSize() - 1; i++)
    {
      //draw our left channel
      line( i, 50  - out.left.get(i)*50,  i+1, 50  - out.left.get(i+1)*50 );
      
      //draw our right channel
      line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
    }
  popMatrix();
  drawInstructions();
  renderTextBox();
}

/**
** This function draws a text box at the bottom of our window
** so we can see what we're typing
**/
void renderTextBox(){
  pushMatrix();
    translate(0, height -140); //translate our drawing to the bottom of our screen
    fill(75);
    noStroke();
    rect(0,0,width,72); //draw our outer rectangle
    pushMatrix();//prepare an inner area where we can draw our text
      translate(12,0);
      drawText(); // draw our additiveExpr String as text
      drawBlinkyCursor();//draw a cursor after our text string
    popMatrix();
  popMatrix();
}

/*
** This function draws our entered text onto the screen
**/
void drawText(){
  textSize(72);
  fill(0);
  textAlign(LEFT, BOTTOM); //align our text left and bottom
  text(additiveExpr, 0,80); //draw our text
}

void mouseMoved()
{
  // usually when setting the amplitude and frequency of an Oscil
  // you will want to patch something to the amplitude and frequency inputs
  // but this is a quick and easy way to turn the screen into
  // an x-y control for them.
  
  float amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude( amp );
  
  float freq = map( mouseX, 0, width, 110, 880 );
  wave.setFrequency( freq );
}

void keyPressed()
{ 
  // if we press enter or return
  if(key == ENTER || key == RETURN){
    String[] waveForms = split(additiveExpr, "+");
    additiveExpr = "";
    if (waveForms != null && waveForms.length > 1) { //if we've entered numbers as an expression
        for(int i = 0; i < waves.size(); i++){//unpatch each of the existing waves from our summer node
          waves.get(i).unpatch(sum);
          waves.remove(i); //remove the element from our waves ArrayList   
        }
        sumWaves(waveForms);
    }
  }
  /**
  ** otherwise if our key characters are ASCII numerical values OR a '+'
  ** The numbers 48,57,and 43 are ASCII character values.  
  ** For more info on ASCII character encoding please see:
  ** http://en.wikipedia.org/wiki/ASCII 
  **/
  else if(key >= 48 && key <= 57 || key == 43){
    additiveExpr += key; //add the char to our expression String
    println(additiveExpr);
  }
}

/**
** function that takes an array of wave types as parameters,
** processes each of the types as a wave type,
** adds and then patches them to our sum node.
**/
void sumWaves(String[] waveTypes){
  for(int i = 0; i < waveTypes.length; i++){
    int waveType = Integer.parseInt(waveTypes[i]);
    switch(waveType){
      case 1:
        waves.add( new Oscil( 440, 0.5f, Waves.SINE ) );
        break;
      case 2:
        waves.add(new Oscil( 440, 0.5f, Waves.TRIANGLE ) );
        break;
      case 3:
        waves.add(new Oscil( 440, 0.5f, Waves.SAW ) );
        break;
      case 4:
        waves.add(new Oscil( 440, 0.5f, Waves.SQUARE ) );
        break;
      case 5:        
        waves.add(new Oscil( 440, 0.5f, Waves.QUARTERPULSE ) );
        break;
      default:
        break;
    }
  }
  //loop through our waves ArrayList.  
  //Notice how we call size() on ArrayLists instead of .length
  //For more info on ArrayLists, see: https://processing.org/reference/ArrayList.html
  for(int i = 0; i < waves.size(); i++){
    waves.get(i).patch(sum); //patch the wave to our summer node;
  }
}

void drawInstructions(){
  pushMatrix();
    translate(12, height-250);
    String instructions = "Instructions: Add waves together by typing an expression, like 1+2+3";
    String instructionsLine2 = "Then press ENTER/RETURN.";
    String key = "Key: 1. Sine, 2. Triangle, 3. Saw, 4. Square, 5. Quarter pulse ";
    fill(255);
    textSize(18);
    text(instructions, 0,0);
    text(instructionsLine2, 0,24);
    text(key, 0,48);
  popMatrix();
}

void drawBlinkyCursor(){
  //every 22 frames, flip our blinkCursor boolean
  if(frameCount % 22 == 0){
    blinkCursor = !blinkCursor; 
  }
  if(blinkCursor){
      //draw our cursor line after our text
      strokeWeight(2);
      stroke(0);
      line(textWidth(additiveExpr),0,textWidth(additiveExpr),72);  
  }
}
