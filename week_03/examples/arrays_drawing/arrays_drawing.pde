float[] xPos;
float[] yPos;
void setup(){
  size(500,500);
  xPos = new float[10];
  yPos = new float[10];
  
  for(int i = 0; i < xPos.length; i++){
    xPos[i] = random(500.0);
    yPos[i] = random(500.0);
  }
}
void draw(){
  background(255);
  for(int i = 0; i < xPos.length; i++){
    fill(255,0,0,50);//r, g, b, alpha
    rect(xPos[i], yPos[i], 300, 250);
  } 
}
