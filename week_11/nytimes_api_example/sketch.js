var leadLines = [];
var currentLineNum = 0;
var currentLine;
var lifetime = 255;

function setup() {
	createCanvas(windowWidth, windowHeight);

		// replace this api key with your own from developer.nytimes.com
	var apiKey = '7384cc04f466965ccf07bc8dc93afb22%3A18%3A66115623';

	//load json from the NYTimes search api.  
	// Notice how we are adding a function callback after the request has completed.
	// try replacing function(data){} with a call to existing function in your code
	loadJSON('http://api.nytimes.com/svc/search/v2/articlesearch.json?q=Obama&api-key='+ apiKey, function(data){
		//since our data is a javascript object, we can use dot notation on it
		//to drill deeper into the data structure
		var docs = data.response.docs;
		for(var article in docs){
			//push the lead paragraph string into our leadLines array
			leadLines.push(docs[article].lead_paragraph);
		}
		println(leadLines);
		currentLine = leadLines[currentLineNum];

	});

}

function draw() {
	background(255);
	if (currentLine){
		if ( lifetime <=0 ){
			currentLineNum++; //increment to next line
			//make sure our current line number does not exceed the bounds of our leadLines array
			currentLineNum = currentLineNum % leadLines.length;
			currentLine = leadLines[currentLineNum];
			lifetime = 255;
		}
		textAlign(CENTER);
		textSize(18);
		fill(255-lifetime);
		noStroke();

		// map our text y-position of text to the lifetime of each line
		var mappedTextPosY = map(lifetime, 0, 255, 0, height /2 );
		
		text(currentLine, width / 2, mappedTextPosY , 500, 500);
		
		lifetime--;
	}
}
