/*
 *   Expression evaluator
 *   Creative Coding DM-GY 6063
 *   evaluates whether the user has typed in "hello world"
 * 
 */
import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="P5 Expression Evaluator";
String description ="Client that sends boolean messages.";
String enteredTxt = "";

//if a user enters this string, the evaluator returns true
String desiredTxt = "hello world";

Spacebrew sb;

color color_truth = color(0, 255, 0);
color color_false = color(255, 0, 0);
int currentColor = color(255,255,255);

boolean evalTrue;

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
  
  if(evalTrue){
    sb.send( "truthy_exp", true);//send a value of true to spacebrew
    background(0,255,0);
    evalTrue = false;//reset the value to false
  }
  
}

void keyPressed(){
  //if the user presses enter or return, the program will evaluate the expression
  if (keyCode == ENTER || keyCode == RETURN){
    
    evalTrue = isTrue(enteredTxt);
    enteredTxt = "";
  }
  else {
    enteredTxt += key;//append our character to the text string
  }
}

boolean isTrue(String txt){

  if (txt.equals("hello world")){
    println(txt);
    return true;
  }
  else return false;
}

void onBooleanMessage( String name, boolean value ){
  println("got bool message " + name + " : " + value);
  // update background color
  if (value == true) {
    currentColor = color_truth;
  } else {
    currentColor = color_false;
  }
}
