#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
		ofCamera cam;
	
		ofSpherePrimitive sphere;
		ofIcoSpherePrimitive icoSphere;
		ofPlanePrimitive plane;
		ofCylinderPrimitive cylinder;
		ofConePrimitive cone;
		ofBoxPrimitive box;
	
		float angle;
	
		ofVec3f centerScreen; //Euclidean vector; center of our screen
		ofLight pointLight;
};
