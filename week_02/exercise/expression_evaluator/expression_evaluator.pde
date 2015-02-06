/*
 *   Expression evaluator
 *   Creative Coding DM-GY 6063
 *   to get started you'll need to download the spacebrew library here:
 *   https://github.com/Spacebrew/spacebrewP5 and move it to your Processing libraries directory/
 *   to test to go: http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc
 * 
 */
import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="P5 Expression Evaluator";
String description ="Client that sends boolean messages.";
String enteredTxt = "";

//if a user enters this string, the evaluator returns true
//@TODO enter your desired text string here
String desiredTxt = "";

Spacebrew sb;

color color_truth = color(0, 255, 0);
color color_false = color(255, 0, 0);
int currentColor = color(255,255,255);

/////////////////////////////////////
//@TODO need to declare global boolean variable 
////////////////////////////////////

void setup() {
  size(500, 400);

  // instantiate the spacebrewConnection object
  sb = new Spacebrew( this );

  // declare your publisher
  sb.addPublish( "truthy_exp", "boolean", true ); 

  // connect to spacebrew
  sb.connect(server, name, description );
      
}

void draw() {
  // set background color
  background( 255 );

  // draw button
  fill(255,0,0);
  stroke(200,0,0);
  rectMode(CENTER);
  rect(width/2,height/2,250,250);

  //description text
  textAlign(CENTER); //center align our text
  textSize(24);
  fill(25);//fill the text with gray
  text("Type an expression", width/2, height/2 - 135 );
  
  //show the user the text he/she has entered
  fill(230); //fill the text with off-white
  text(enteredTxt, width/2, height/2 + 12);
  
  ////////////////////////////////////////////////////////////
  //@TODO replace isTrue with your boolean variable from above
  // and uncomment this code
  /////////////////////////////////////////////////////////////
  //  if(isTrue){
  //    sb.send( "truthy_exp", true);//send a value of true to spacebrew
  //    isTrue = false;//reset the value to false
  //  }
  
}

void keyPressed(){
  enteredTxt += key;//append our character to the text string
  
  //if the user presses enter or return, the program will evaluate the expression
  if (keyCode == ENTER || keyCode == RETURN){
    
    /////////////////////////////////////////////////
    //@TODO add a call to your evaluation function here.
    // the value returned by this function should be assigned to your boolean variable
    // declared above 
    ////////////////////////////////////////////////
    
    enteredTxt = "";
  }
}

///////////////////////////////////////////////
// @TODO define an evaluator function here
// the function should process a String as its argument
// and should return true or false, depending on whether the string entered
// was the same string as your desiredTxt variable.
////////////////////////////////////////////////

void onBooleanMessage( String name, boolean value ){
  println("got bool message " + name + " : " + value);
  // update background color
  if (value == true) {
    currentColor = color_truth;
  } else {
    currentColor = color_false;
  }
}
