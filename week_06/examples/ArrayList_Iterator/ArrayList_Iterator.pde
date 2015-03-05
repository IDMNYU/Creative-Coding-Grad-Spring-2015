ParticleSystem system;
void setup(){
  size(500,500);
  system = new ParticleSystem(1000);
}
void draw(){
  background(0);
  system.addParticle();
  //update and align the emmitter location to our mouse position
  system.update(new PVector(mouseX, mouseY));
}
