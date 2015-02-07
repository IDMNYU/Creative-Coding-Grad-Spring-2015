/*
** Cyclist Count by Year At Selected Commuter Locations
** data from:
** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
** your task: create a unique data visualization.
** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
*/

void setup(){
  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");
  println(lines);
}
void draw(){}
