// Spacebrew_to_LittleBits.ino

int byteFromProcessing = 0;
int led_pin = 9;
boolean debug = false;
boolean isPressed = false;

void setup(){
  pinMode(led_pin,OUTPUT);
  digitalWrite(9, LOW);
  Serial.begin(9600);
  // if(debug!=true){  
  //   establishContact(); 
  // }
}


void loop(){
  
  if(debug!=true){    
    if (Serial.available() > 0){
      byteFromProcessing = Serial.read();
      if(byteFromProcessing=='A'){ //more data was requested
        isPressed = true;
        // Serial.write(sensor_val_map);
      } else if(byteFromProcessing == 'B'){
        isPressed = false;
      }
    }    
  }
  if(isPressed){
      digitalWrite(9, HIGH);
  } else {
    digitalWrite(9, LOW);
  }
}


// void establishContact(){
//   while(Serial.available() <= 0) {
//     Serial.print('A'); 
//     delay(100);
//   }
// }
