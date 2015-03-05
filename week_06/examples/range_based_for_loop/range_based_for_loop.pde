PVector[] vectors = new PVector[10];
void setup(){

  //standard for loop
  for(int i=0; i < vectors.length; i++)
  {
    vectors[i] = new PVector(random(1), random(1));
  }
  
  //range-based for loop
  // try changing the loop above to a range-based 
  // for loop
  for(PVector vector : vectors)
  {
    println(vector.x, vector.y);
  }
}
