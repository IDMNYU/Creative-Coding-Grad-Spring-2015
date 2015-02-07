void setup(){
  // create a String array with literal initialization
  String[] names = { "John", "Sue", "Avani", "Keith" };
  
  // we want to add “Terrence” to our array 
  // so we create a new array with 5 indices
  String[] namesExpanded = new String[names.length+1];
  //copy values from src into destination array
  arrayCopy(names, namesExpanded);
  namesExpanded[4] = "Terrence";
  println(namesExpanded);
}
