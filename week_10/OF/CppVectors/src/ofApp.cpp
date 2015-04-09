#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

	std::string url = "http://api.giphy.com/v1/stickers/search?q=cat&api_key=dc6zaTOxFJmzC";
	
	//if we can't open our url, tell us we've failed
	if (!response.open(url))
	{
		cout << "Failed to parse JSON" << endl;
	}
	
	//loop through our response data
	for (int i = 0; i < response["data"].size(); i++) {
		std::string gifUrl = response["data"][i]["images"]["fixed_height"]["url"].asString();
		ofImage img; //create a local ofImage variable
		img.loadImage(gifUrl); //load our parsed url into our image variable
		images.push_back(img);//push the image result into our vector
	}
}

//--------------------------------------------------------------
void ofApp::update(){
	
}

//--------------------------------------------------------------
void ofApp::draw(){
	ofBackground(255, 255, 255);
	
	//size_t is another way to iterate through a list of objects
	// try changing size_t for int or unsigned int
	for (size_t i = 0; i < images.size(); i++) {
		images[i].draw(i * 25, ofRandom(0.0f, ofGetHeight()));
	}
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
