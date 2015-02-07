void setup(){
  int[] evenNumbers = new int[100];
  for (int i = 0; i < 100; i++){
    evenNumbers[i] = i * 2;
  }
  println(evenNumbers);
  
  float[] tenths = new float[10];
  float number = 0.0;
  for (int j = 0; j < 10; j++){
    tenths[j] = (number += 0.1);
  }
  println(tenths);
}
