#pragma once

#include "ofMain.h"

/*
 
DESCRIPTION:
 This program is intended to record and play short sound samples.
 Press 1 to record, and press 2 to play.
 

SOURCE:
This code is based on Example 05-LoopSampler from the e-book,
Mastering openFrameworks (Perevalov), Ch.6 Working with Sounds
 
 WARNING FROM TEXTBOOK:
 To avoid the hazard of damaging your ears,
 do not listen the project's output sound with headphones.
 This project uses low-level audio output, so due
 possible errors in software it can suddenly
 generate clicks and very loud sounds.
 
 */

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();
		void mousePressed(int x, int y, int button);
	
		//Function for receiving audio
		void audioReceived( float *input, int bufferSize, int nChannels );
	
		//Function for generating audio
		void audioOut( float *output, int bufferSize, int nChannels );
	
		//Object for sound output and input setup
		ofSoundStream soundStream;

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		//void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
		
};
