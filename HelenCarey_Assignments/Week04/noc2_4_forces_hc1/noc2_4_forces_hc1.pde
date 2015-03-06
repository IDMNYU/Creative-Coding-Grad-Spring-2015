//This code is a variation of Examples 2_1-2_8 in 
//Daniel Shiffman's The Nature of Code at http://natureofcode.com


Mover[] movers = new Mover[30];
color[] ballcolor = new color[movers.length];
float size = 16;

Liquid jello; 

void setup() {
  size(500, 500);
  //size(displayWidth/2, displayHeight/2); used for blog video
  randomSeed(1); 
  smooth();

//create the balls
  for (int i = 0; i < movers.length; i++) {
    //limited random colors to create a varied but complimentary pallette
    ballcolor[i] = color(random(50,100), random(150,250), random(150,250), 222);
    //from mover class: Mover(float m, float x , float y, color c, float s)
    //balls come in 3 sizes (mass), can generate anywhere along the axis, 
    //start at the top, and get a size value which includes some variation via noise()
    movers[i] = new Mover(random(1,3), random(width), 0, ballcolor[i], size);
  }
    jello = new Liquid(44, 75, width/2, height/3, 1);
} // END SETUP

void draw() {
  fill(50,1); //'fade w/ time' fill
  rect(0,0,width,height); //background
  jello.display();
  
  float spSize = random(1,size/2); //sparkle size
  
  //make sparkles. just for fun.
  for (int j=0; j<2; j++) {   //sparkle loop
    noStroke();
    ellipse(random(width), random(height), spSize, spSize);
    fill(random(200,255), random(150, 255), random(100, 200), random(0,255));
  }
  
  //make balls with all the new forces
    for (int i = 0; i < movers.length; i++) {
     
    if (jello.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = jello.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }  
      
    PVector wind = new PVector(.01, 0);   
    if (mousePressed) {
      wind = new PVector(.5,0);
      movers[i].applyForce(wind);
    }

     PVector gravity = new PVector(0, 0.1*movers[i].mass);
  
      float c = 0.05; // friction coefficient
      float normal = 1; // the 'normal force' (the equal and opposite force)
      float frictionMag = c*normal; //this is the magnitude of the friction
      
      PVector friction = movers[i].velocity.get();
      friction.mult(-1); 
      friction.normalize();
      friction.mult(frictionMag); // friction unit V * the friction mag (scalar) = our friction force vector
  
      movers[i].applyForce(friction);
      movers[i].applyForce(wind);
      movers[i].applyForce(gravity);
  
      movers[i].update();
      movers[i].display();
      movers[i].checkEdges();
    }
   } // END DRAW
   


