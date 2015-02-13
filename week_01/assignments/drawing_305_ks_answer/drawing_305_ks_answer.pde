/**
 * Sol Lewitt's Wall Drawing #305
 * code interpretation by Kevin Siwoff
 * 2/1/15
 * The Eighth point is located halfway between the two points, 
 * where an arc with its center at the first point and with a radius 
 * equal to the distance between the first and the seventh points would cross a line 
 * from the upper right corner to a point halfway between the midpoint of the bottom side and the lower right corner.
 */

boolean showCircles = true;

void setup() {
  size(450, 300);
  smooth();

  // float c = sqrt(sq(112.50) + sq(150.0));
  
  // float b = 300.0 - (337.5 * (300/112.50));
  
  float x = 850.0 / (300/112.50);
  
  println(x);
}
void draw() {
  background(255);

  noFill();
  point(350, 250); //point #1
  point(450, 150); //point #2
  point(337.5, 300); //point #3
  point(450, 0);//point #4
  point(258.5, 150);//point #5 
  point(330, 100);//point #6
  point(350, 150);//point #7
  point(400, 200); //point #8

  //  point(393.75,150);
  //  ellipseMode(CENTER);
  //  ellipse(393.75,150, 10,10);

  line(337.5, 300, 450, 0);
  noFill();

  //  arc(393.75,150,112.5,112.5,0,PI);
  arc(358.5, 150, 185, 185, 0, PI);

  if (showCircles) {
    ellipseMode(CENTER);
    ellipse(359.5, 150, 10, 10); //point#7
    ellipse(450, 150, 10, 10);
    fill(255,0,0);
    ellipse(337.5, 300, 10, 10);//point #3
    noFill();
    ellipse(450, 0, 10, 10);
    fill(0,255,0);
    ellipse(265.5, 150, 10, 10); //point#5
    noFill();
    ellipse(330, 100, 10, 10);
    ellipse(359.5, 241.33, 10, 10);//point #1
    ellipse(400, 200, 10, 10);
  }
}
