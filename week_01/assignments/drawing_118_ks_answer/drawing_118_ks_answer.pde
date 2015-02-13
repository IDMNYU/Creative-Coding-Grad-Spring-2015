/**
* Sol Lewitt's Wall Drawing #118
* code interpretation by Kevin Siwoff
* 2/1/15
*/
void setup(){
  size(500,500);
  background(255);
  noFill();
  smooth();
  beginShape(TRIANGLE_STRIP);
    for(int i=0; i < 50; i++){
      vertex(random(0,width), random(0,height));
    }
  endShape();
}
void draw(){
  
}
