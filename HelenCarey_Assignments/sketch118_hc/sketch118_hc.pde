/* ************************************
From Sol Lewitt's Wall Drawing #118:

On a wall surface, any continuous stretch of wall, using a hard pencil, 
place fifty points at random.  
The points should be evenly distributed over the area of the wall.
All of the points should be connected by straight lines.
************************************ */

// GLOBALS
//size(500,500); //test
size(displayWidth, displayHeight); //wall = viewport
background(#FAF5ED); //off-white (aka wall-colored)
smooth(); //anti-alias

stroke(#777777, 25); //graphite-ish, 25alpha
strokeWeight(1);
//line(0, 0, width, height); //test diagonal


//init my varibales
int rows = 50; //rows
int cols = 2;  //cols
int i = 0; //index for x coords
int j = 0; //index for y coords

//create a 2d array of x1,y1 coordinates
float [][] points = new float [rows][cols];
// float [][] points = new float[50][2];


// forLoop to create 50 points at random locations
  for(i=0; i<50; i++) {
    points[i][0] = random(width-50);  // puts a random int<width-50 in row i, col1 (x coord.)
    points[i][1] = random(height-50); //puts a random int<height-50 in row i col2 (y coord.)
    println(points[i][0] + ",", points[i][1]); //coord log
    //point(points[i][0],points[i][1]); //"place fifty points at random" test
  }
  

// use a nested forLoop to traverse the matrix
for(i=0; i<50; i++) {    // loop to move thru the matrix vertically
   for(j=0; j<50; j++) {   // loop to move thru the matrix horizontally
     println(points[i][0]+", ", points[i][1]+ " x ", points[j][0]+ ", ", points[j][1]); //coord log
     line(points[i][0], points[i][1], points[j][0], points[j][1]); // draws line from each point to every other point
   }
}
