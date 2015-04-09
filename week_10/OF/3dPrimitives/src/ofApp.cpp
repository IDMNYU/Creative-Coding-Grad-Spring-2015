#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	cam.setupPerspective();
	float width = 100.0;
	float height  = 100.0;
	
	ofSetSmoothLighting(true);
	
	//set the difuse light color
	// ofFloatColor values range from 0.0 -> 1.0
	pointLight.setDiffuseColor( ofFloatColor(0.85, 0.85, 0.55) );
	
	//set the specular light color
	pointLight.setSpecularColor( ofFloatColor(1.0, 1.0, 1.0));
	
	//set the size of each 3d primative
	plane.set( width*1.5, height*1.5 );
	box.set( width*1.25 );
	sphere.setRadius( width );
	icoSphere.setRadius( width );
	cylinder.set(width*.7, height*2.2);
	cone.set( width*.75, height*2.2 );
	
	angle= 0.0;
	centerScreen = ofVec3f(ofGetWindowWidth() * 0.5,ofGetWindowHeight() * 0.5, 0.0 );
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	ofBackground(100);
	ofEnableDepthTest();
	ofEnableLighting();
	pointLight.enable();
	
	plane.setPosition(centerScreen);
	plane.rotate(angle, 1.0, 0.0, 0.0);
	plane.rotate(angle, 0, 1.0, 0.0);
	
	box.setPosition(centerScreen + ofVec3f(0.0, -200.0, -200.0));
	box.rotate(angle, 1.0, 0.0, 0.0);
	box.rotate(angle,0.0,1.0,0.0);
	
	sphere.setPosition(centerScreen + ofVec3f(0.0, 200.0, -200.0));
	sphere.rotate(angle, 1.0,0.0,0.0);
	sphere.rotate(angle, 0.0,1.0,0.0);
	
	
	icoSphere.setPosition(centerScreen + ofVec3f(0.0, -400.0, -400.0));
	icoSphere.rotate(angle, 1.0,0.0,0.0);
	icoSphere.rotate(angle, 0.0,1.0,0.0);
	
	cylinder.setPosition(centerScreen + ofVec3f(0.0,400.0,-400.0));
	cylinder.rotate(angle, 1.0,0.0,0.0);
	cylinder.rotate(angle, 0.0,1.0,0.0);
	
	
	cone.setPosition(centerScreen + ofVec3f(0.0,-400.0, 0.0));
	cone.rotate(angle, 1.0,0.0,0.0);
	cone.rotate(angle, 0.0,1.0,0.0);
	
	
	plane.draw();
	box.draw();
	sphere.draw();
	icoSphere.draw();
	cylinder.draw();
	cone.draw();
	
	angle+=0.001;
	
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	cout << sizeof(key) << endl;
switch (key) {
  case 0:
			cout << "pressed 0" << endl;
			break;
			
  case 'a':
			cout << "pressed a" << endl;
			break;
	}
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
