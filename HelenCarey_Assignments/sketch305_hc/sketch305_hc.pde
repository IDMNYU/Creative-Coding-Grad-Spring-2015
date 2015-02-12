/* ************************************
 From Sol Lewitt's Wall Drawing #305:
 
 The Eighth point is located halfway between the two points where an arc with 
 its center at the first point and with a radius equal to the distance between 
 the first and the seventh points would cross a line from the upper right corner 
 to a point halfway between the midpoint of the bottom side and the lower right corner.
 ————————————————————————————————————————
 Explanation from MoCA:
 http://www.massmoca.org/lewitt/walldrawing.php?id=305
 
 Wall Drawing 305 is composed of one hundred random specific points that are
 determined by the draftsman. The points are random in that they may be placed 
 anywhere on the wall. The draftsman uses Sol LeWitt’s vocabulary and geometric 
 lexicon to guide the mapping of the points. This lexicon includes the corners,
 midpoints and center of each wall, which serve as reference points that are connected 
 and traversed by lines and arcs. The one hundred points are specific in that they are 
 created at the meeting of the junctures of these formal elements. As the draftsman 
 maps out each generated point, he or she writes a description of how he or she arrived 
 at that point next to it. This allows the viewers to trace the process of the 
 placement of the points.
 
 Wall Drawing 305 is one of a series of drawings in which LeWitt experimented with textual 
 instructions that direct the draftsman to construct shapes on the wall. Called ‘location’ 
 drawings, these works are done in black pencil with geometric figures emphasized in crayon, 
 foregrounding the process of drawing as a problem-solving mechanism.
 
 http://www.massmoca.org/lewitt/walldrawing.php?id=305
 
 ************************************ */
void setup() {  
//size(500, 500); //test environment
size(displayWidth, displayHeight); //wall = viewport
frameRate(2);
}
 
void draw() {  

  // GLOBALS
  background(#FAF5ED); //off-white (aka wall-colored)
  smooth(); //anti-alias
  stroke(#777777, 100); //graphite-ish, 25alpha
  strokeWeight(1);
  noFill();
  
  //////////////////////////////// 
  //Draw line 
    line(width, 0, width * 0.75, height);
    strokeWeight(2);
  
  
  ///////////////////////////// 
  //Generate 100 random points
  
    //init variables
    int rows = 100; //rows
    int cols = 2;  //cols
    int i = 0;
    
    //create a 2d array for x1,y1 coordinates
    float [][] points = new float [rows][cols];
    // float [][] points = new float[100][2];
    
    // forLoop to create 100 points at random locations
    for (i=0; i<100; i++) {
      points[i][0] = random(width-50);  // puts a random int<width-50 in row i, col1 (x coord.)
      points[i][1] = random(height-50); //puts a random int<height-50 in row i col2 (y coord.)
      println(points[i][0] + ",", points[i][1]); //coord log
      stroke(0);
      point(points[i][0], points[i][1]); //"place fifty points at random"
    }
    
    //Rewrite x-value of pt1 to a random point in the right most quarter of the wall
    points[0][0] = random((width/4)*3,width);
    println(points[0][0] + ",", points[0][1]);
  
    //NOTE 
      /* If I had more time I would have rewritten points[0][0] to be generated as a tangent somewhere along the slope of the line.
     `   Unfortunately,  I don't not remember that much high school math, and don't have the time to figure it out right now. :(
     */
  
  ///////////////////////////// 
  //Create the arc
  
  //calculate dist between pt1 & pt7
  //dist = sqrt of (x1-x7)2 + (y1-y7)2
  
  float dist = sqrt(sq(points[0][0] - points[6][0]) + sq(points[0][1]-points[6][1]));
  //println(dist);  

  //draw the arc
  stroke(#777777, 100);
  arc(points[0][0], points[0][1], dist, dist, PI+QUARTER_PI, TWO_PI+PI);
 
  
} //END draw



