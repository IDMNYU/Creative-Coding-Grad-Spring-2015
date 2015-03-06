//This code is a variation on Examples 2_1-2_8 in 
//Daniel Shiffman's The Nature of Code at http://natureofcode.com

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color ballcolor;
  float size;
  int t = 0;
  float n = noise(t); //just trying out some noise
  float N = map(n,0,1,0,width); //just trying out some noise
  float topspeed; // necessary for mouse attraction


  Mover(float m, float x , float y, color c, float s) {
    mass = m; //value of 1-3
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 5;
    ballcolor = c;
    size = s*(1.1*n); //this is different from mass. it might add some variation.
  }
   
   void applyForce(PVector force) {
    PVector f = PVector.div(force,mass); // wind/mass = the acceleration to add
    acceleration.add(f);
  }
  
// == UPDATE THE FORCE CALCULATIONS ================== 
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    acceleration.setMag(.15); 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

// == DISPLAY ==================  
  void display() {
    stroke(#2B3856);
    fill(ballcolor);
    ellipse(location.x,location.y,mass*size,mass*size);
  }



// == EDGES ==================
  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }

  }

}



