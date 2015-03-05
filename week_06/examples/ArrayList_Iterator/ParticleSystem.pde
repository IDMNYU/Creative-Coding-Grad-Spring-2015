import java.util.ArrayList;
import java.util.Iterator;

class ParticleSystem
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector emmitterLocation;
  
  ParticleSystem(int numParticles){
    this.emmitterLocation = new PVector(mouseX,mouseY);
    for(int i=0; i < numParticles; i++){
      //add a new particle to our particles ArrayList
      particles.add(new Particle(emmitterLocation));
    }
  }
  
  void update(PVector loc){
    emmitterLocation = loc.get();
    
    //create an ArrayList iterator
    Iterator<Particle> it = particles.iterator();
    
    while(it.hasNext()){
      //it.next() returns our next Particle object
      Particle particle = it.next();
      particle.update();
      if(particle.isDead()){
        it.remove();//notice how we call remove on the iterator
      } else {
        particle.display();
      }
    }
    
  }
  
  void addParticle(){
    particles.add(new Particle(emmitterLocation));
  }
  
}
