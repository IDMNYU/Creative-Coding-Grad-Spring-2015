/**
* Code adapted from NOC chapter 4
**/
class Particle
{
  PVector loc;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;
  
  public Particle(PVector location){
     this.loc = location.get();
     this.lifespan = 255.0;
     this.mass = 4.5;
     this.velocity = new PVector(random(-1,1), random(0,1));
     this.acceleration = new PVector(0.3,0.3);
  }
  
  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    loc.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan);
    ellipse(loc.x,loc.y,12,12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
