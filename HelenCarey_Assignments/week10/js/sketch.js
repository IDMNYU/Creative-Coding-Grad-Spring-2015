var leWitt = function(sketch) {

  sketch.setup = function() {
    sketch.createCanvas(719, 399);
    sketch.frameRate(.75);
    //sketch.noLoop();

  }; //END setup

  sketch.draw = function() {
    sketch.clear();
    //sketch.background(196,200,200,50);
    //rgb(196, 201, 200)
    
    sketch.stroke(64,64,64,15);

    sketch.strokeWeight(0.75);
    sketch.noFill();

    var rows = 50; //rows
    var cols = 2;  //cols
    var i = 0; //point iterator
    var j = 0; //point connector

    var x = 1;

    var points = [];

    for (var i = 0; i < 50; i++) {
      points[i] = []; //create a 2d array
      points[i][0] = sketch.random(25, sketch.width-25); //populate rows: puts a random int<width-50 in row i, col1 (x coord.)
      points[i][1] = sketch.random(25, sketch.height-25); //populate rows: puts a random int<height-50 in row i col2 (y coord.)
      sketch.point(points[i][0],points[i][1]); //"place fifty points at random"
      //sketch.print(points.length + ": x is " + points[i][0]);
      //sketch.print(points.length + ": y is " + points[i][1]);
    }; 

  for(i=0; i<50; i++) {    // loop to move thru the array
      for(j=0; j<50; j++) {   // nested loop to connect each point in the array to the 50 other points
        sketch.line(points[i][0], points[i][1], points[j][0], points[j][1]);  
      } //END 'for j'
    } //END 'for i'


    /* TEST: Wiggle Dot Sketch

      sketch.ellipse(x,y, 64, 64);
      y = y + sketch.random(-1.5, 1.5);
      if (sketch.mouseX > x) {
        x = x + sketch.random(0,1);
      } else {
        x = x - sketch.random(0,1);
      };
    */

  }; //END draw

}; // END leWitt


/////// DISPLAY /////// 
// Create the p5 instance by passing your new canvas fx and specifing the div id
window.onload = function() {
  var canvas = document.getElementById( 'canvas' );

  var drawing = new p5(leWitt, 'canvas');
};





/*  ===================================
    ORIGINAL PROCESSING SKETCH: Homework #1

/* ************************************
From Sol Lewitt's Wall Drawing #118:

On a wall surface, any continuous stretch of wall, using a hard pencil, 
place fifty points at random.  
The points should be evenly distributed over the area of the wall.
All of the points should be connected by straight lines.
************************************ */

/*
void setup() {  
//size(500, 500); //test environment
size(displayWidth, displayHeight); //wall = viewport
frameRate(1);
}
 
void draw() { 

// GLOBALS
background(#FAF5ED); //off-white (aka wall-colored)
smooth(); //anti-alias
  
stroke(#777777, 25); //graphite-ish, 25alpha
strokeWeight(1);
//line(0, 0, width, height); //test diagonal


//init my varibales
int rows = 50; //rows
int cols = 2;  //cols
int i = 0; //point iterator
int j = 0; //point connector

//create a 2d array of x1,y1 coordinates
float [][] points = new float [rows][cols];


// forLoop to create 50 points at random locations
  for(i=0; i<50; i++) {
    points[i][0] = random(width-50);  // puts a random int<width-50 in row i, col1 (x coord.)
    points[i][1] = random(height-50); //puts a random int<height-50 in row i col2 (y coord.)
    point(points[i][0],points[i][1]); //"place fifty points at random"
    println(points[i][0] + ",", points[i][1]); //coord log
  }
  

// use a nested forLoop to traverse the matrix & draw the lines
for(i=0; i<50; i++) {    // loop to move thru the array
   for(j=0; j<50; j++) {   // nested loop to connect each point in the array to the 50 other points
     println(points[i][0]+", ", points[i][1]+ " x ", points[j][0]+ ", ", points[j][1]); //coord log
     line(points[i][0], points[i][1], points[j][0], points[j][1]);    
   }
}

} //END draw

*/







