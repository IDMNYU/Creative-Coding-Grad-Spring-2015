class Dog  {
  String hello = "hi there";
  Dog(){}
  Dog(String greeting){
    this.hello = greeting;
  }
  void sayHello(String greeting){
    println(greeting);
  }
  void sayHello(){
    println(hello);
  }
}
void setup(){
  Dog myDog = new Dog("hi my name is kevin");
  myDog.sayHello();
}
