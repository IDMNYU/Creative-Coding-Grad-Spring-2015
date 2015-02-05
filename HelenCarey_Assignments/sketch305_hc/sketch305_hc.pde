/* ************************************
From Sol Lewitt's Wall Drawing #305:

The Eighth point is located halfway between the two points where an arc with its center at the first point and with a radius equal to the distance between the first and the seventh points would cross a line from the upper right corner to a point halfway between the midpoint of the bottom side and the lower right corner.
————————————————————————————————————————
Explanation from MoCA:
http://www.massmoca.org/lewitt/walldrawing.php?id=305

Wall Drawing 305 is composed of one hundred random specific points that are determined by the draftsman. The points are random in that they may be placed anywhere on the wall. The draftsman uses Sol LeWitt’s vocabulary and geometric lexicon to guide the mapping of the points. This lexicon includes the corners, midpoints and center of each wall, which serve as reference points that are connected and traversed by lines and arcs. The one hundred points are specific in that they are created at the meeting of the junctures of these formal elements. As the draftsman maps out each generated point, he or she writes a description of how he or she arrived at that point next to it. This allows the viewers to trace the process of the placement of the points.

Wall Drawing 305 is one of a series of drawings in which LeWitt experimented with textual instructions that direct the draftsman to construct shapes on the wall. Called ‘location’ drawings, these works are done in black pencil with geometric figures emphasized in crayon, foregrounding the process of drawing as a problem-solving mechanism.

http://www.massmoca.org/lewitt/walldrawing.php?id=305

************************************ */


// GLOBALS
size(500,500); //test
//size(displayWidth, displayHeight); //wall = viewport
background(#FAF5ED); //off-white (aka wall-colored)
smooth(); //anti-alias

stroke(#777777, 100); //graphite-ish, 25alpha
strokeWeight(1);

line(width, 0, width * 0.75, height);
strokeWeight(2);

//init my variables
int rows = 100; //rows
int cols = 2;  //cols
int i = 0; //index for x coords
//int j = 0; //index for y coords

//create a 2d array for x1,y1 coordinates
float [][] points = new float [rows][cols];
// float [][] points = new float[100][2];

// forLoop to create 100 points at random locations
  for(i=0; i<100; i++) {
    points[i][0] = random(width-50);  // puts a random int<width-50 in row i, col1 (x coord.)
    points[i][1] = random(height-50); //puts a random int<height-50 in row i col2 (y coord.)
    println(points[i][0] + ",", points[i][1]); //coord log
    stroke(0);
    point(points[i][0],points[i][1]); //"place fifty points at random" test
  }
 
 //calculate dist between pt1 & pt7
 //// d = root of (x1-x7)2 + (y1-y2)2
 float x1 = points[0][0];
 float x7 = points[0][1];
 float y1 = points[6][0];
 float y7 = points [6][1];
 float xs = sq(x1-y1);
 float ys = sq(x7-y7);
 float n = xs + ys;
 //float dist = points[0][0] - points[6][0];
 println(x1);
 println(x7);
 println(y1);
 println(y7);
 println(xs + " is xs" );
 println(ys + " is ys");
 println(n + " is n");
 
 
 
 
 
 //
 
  //arc(50, 55, 200, 80, PI+QUARTER_PI, TWO_PI);
  
  //arc(points[0][0], points[0][1], 150, height/2, PI, PI); //
  
 //arc(a, b, c, d, start, stop)
  /*
a  float: x-coordinate of the arc's ellipse
b  float: y-coordinate of the arc's ellipse
c  float: width of the arc's ellipse by default
d  float: height of the arc's ellipse by default
start  float: angle to start the arc, specified in radians
stop  float: angle to stop the arc, specified in radians
*/

  


