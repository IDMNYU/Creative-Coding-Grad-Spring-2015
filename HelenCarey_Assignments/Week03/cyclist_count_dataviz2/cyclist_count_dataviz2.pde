/*
** Cyclist Count by Year At Selected Commuter Locations
 ** data from:
 ** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
 ** your task: create a unique data visualization.
 ** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
 */

String[] headers;
float[][] data; 
int[] years; 
float[] totals;
float y;
PImage bg;
color[] palette = {
  #741952, #fff173, #fe3174, #cee879, #94bb68, #ff9900, #09a3ad, #741952, #fff173, #fe3174, #cee879, #94bb68, #ff9900, #09a3ad, #741952, #fff173, #fe3174, #cee879, #94bb68, #ff9900, #09a3ad, #741952, #fff173, #fe3174, #cee879, #94bb68, #ff9900, #09a3ad
};

void setup() {
  size(1400, 500);
  //frameRate(4);
  bg = loadImage("wheel2.png");

  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");
  //println(lines.length);


  //split the first line into an array and load it into our global headers array
  headers = split(lines[0], ",");
  //println(headers.length);


  //create a temporary 2D String array for int data matrix
  String[][] tempData = new String[lines.length-1][headers.length];
  println( lines.length-1 + " rows by " + headers.length + " cols.");
  //data matrix dimensions should be: 28 rows x 9 cols


  //loop through each of the subsequent lines after the header row and assign each to the row index of our tempData matrix 
  // in other words, get line [1] of lines[] and assign it to line [0] of tempData  
  for (int i = 1; i < lines.length; i++) {
    tempData[i-1] = split(lines[i], ",");
  }
  //println(headers); println(tempData[0]); println(tempData[1]); println(tempData[2]); //just checking


  //construct our global data matrix
  data = new float[tempData.length][tempData[0].length];

  //loop through each of the rows and columns of our tempData matrix
  for (int i = 0; i < tempData.length; i++) { //for each row
    for (int j = 0; j < tempData[i].length; j++) { //and for each col

      /*
      * since our raw data has "" (quotes) around each entry,
       * we need a way to remove them.  Let's use the handy split() method.
       * The delimiter is a " (double quotes) but we need to escape it using a forward slash.
       * for more info on escape characters in Java see:
       * http://stackoverflow.com/questions/1367322/what-are-all-the-escape-characters-in-java
       * example: split(""1024"", "\"") becomes --> {"", "1024", ""}  
       */
      String[] tempCellValue = split(tempData[i][j], "\"");
      // our middle entry contains the data, so we write tempCellValue[1] //??? I DON"T UNDERSTAND "MIDDLE ENTRY"
      // handle our blank data OR data containing "N/A" by replacing with 0s 
      if (tempCellValue[1].equals("") || tempCellValue[1].equals("N/A")) {
        data[i][j] = 0;
      } else {
        data[i][j] = parseFloat(tempCellValue[1]);
      }
    }
  }

  years = new int[28];
  for (int i=0; i < data.length; i++) {
    years[i] = parseInt(data[i][0]);
  }

  totals = new float[28];
  for (int i=0; i < data.length; i++) {
    totals[i] = data[i][8];
  }
  
  headers = reverse(headers);
}

//******************************

void draw() {
  background(75);
  background(bg);
  stroke(180); 
  fill(180);
  textAlign(LEFT);

// sketch header
  textSize(48);
  fill(255);
  text("Cyclist Count by Year", 50, 75); 
  textSize(12);
  text("The tires stacks are labeled from top (#1) to bottom (#7). The height of each tire represents the proportion of the total cyclist count for the year.", 50, 110);

  
  println(headers);
  for(int i = 1; i<headers.length-1; i++) {
   text("Tire " + i + ": " +headers[i], 55, 120+(i*25));
  }

//create years columns
  for (int i = 0; i < years.length; i++) {
    noStroke(); 
    fill(#333333);
    float bar = totals[i]/50;
    rect(i * 47+50, height-75-bar, 40, bar);
    fill(255);
    text(years[i], i * 47+55, height-55);
  }


 //stack up the wheels. the height of each wheel
 // is based each location's % of the year stack
  for (int i=0; i<data.length; i++) { 
    float z = 0; //this is just a counter
    float alpha = 75;
    for (int j=0; j<data[i].length-2; j++) {     
      y = data[i][j+1];
      stroke(palette[i], alpha);
      strokeWeight(5);  
      fill(#333333);
      for (int k=0; k<1; k++) {
        float bar = y/50;
        ellipseMode(CORNER);
        ellipse(i * 47+50, height-75-z-bar, 40, bar);
        //rect(i * 47+50, height-75-z-bar, 40, bar);
        alpha += 25;
      }
      z = y/50+z; //the 2nd tire starts where the last one left off
    }
  }     
      
} //END DRAW

// ===================================



