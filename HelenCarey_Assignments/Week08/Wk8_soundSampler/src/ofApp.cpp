#include "ofApp.h"

/**********  WARNING FROM TEXTBOOK ***********************
 To avoid the hazard of damaging your ears,
 do not listen the project's output sound with headphones.
 This project uses low-level audio output, so due
 possible errors in software it can suddenly
 generate clicks and very loud sounds.
 ********************************************/


//CONSTANTS
const int sampleRate = 44100;           //Sample rate of sound, 44100 is CD quality
const float duration = 0.25;            //Duration of the recorded sound in seconds
const int N = duration * sampleRate;    //Size of the PCM buffer array (pcm=digi audio signal)

const float volume = 0.5;	//Output sound volume


//GLOBAL VARIABLES

vector<float> buffer;		//PCM buffer of sound sample
/*
 This is a vector array used as storage for sound recording and also as a
data source for sound playing. This buffer has a size which is generally not 
equal to the size of the input and output buffers passed in the audioReceived()
and audioOut() functions. This means we need to use variables for holding
the current recording and playing position, recPos and playPos respectively.
*/

int recPos = 0;				//Current recording position in the buffer
int playPos = 0;			//Current playing position in the buffer

int recordingEnabled = 1;	//Marker: Is recording enabled?
int playingEnabled = 0;		//MArker: Is playing enabled?
//hc enabled playing


//--------------------------------------------------------------
void ofApp::setup(){
	//Set buffer size and fill it by zeros
	buffer.resize( N, 0.0 );
	
	// SAMPLE CODE
	//Start the sound output in stereo (2 channels)
	//and sound input in mono (1 channel)
	//ex: soundStream.setup( this, 2, 1, sampleRate, 256, 4 );
	
	soundStream.setup( this, 2, 1, sampleRate, 512, 4 );
	/* ofSoundStreamSetup(int nOutputs, int nInputs, int sampleRate, 
	 int bufferSize, int nBuffers)
	*/
	
	/* HC NOTES
	 http://openframeworks.cc/documentation/sound/ofSoundStream.html
	//'this' is a pointer to the testApp object which will recieve the mic data 
	 by calling testApp::audioRecieved
	 //2 output channels
	 //1 input channel
	 //sample rate = 44100Hz, CD quality
	 //512 is the size of the buffer that your system supports. 
	 However, 256 may increase sound quality but cost in memory.
	 //nBuffers = 4 is the # of buffers your app will create and swap out. 
	 (The more buffers, the faster your computer will write info into the 
	 buffer, but the more memory it will take up.)
*/
	 }

//--------------------------------------------------------------
void ofApp::update(){
	//nothing to update
}

//--------------------------------------------------------------
void ofApp::draw(){
	
	//Set the background to white
	ofBackground( 255, 255, 255 );
	
	//Width of the sound viz picture
	int w = 1024;
	
	
	//--------------
	//Line graph of the sound buffer
	ofSetColor( 0, 0, 0 );
	
	//Convert the sound buffer graph to the appropriate display size
	/* B/c w (width of sound viz) < N (size of buffer), we must scale the buffer
	 display with formula: i = float( x) * N / w
	 */
	for (int x=0; x<w; x++) {
		int i = float(x) * N / w;   //Convert x to buffer's position
		ofLine( x, 100, x, 100 - buffer[i] * 100 );
		//draws the line: ofLine(float x1, float y1, float x2, float y2)
		//http://openframeworks.cc/documentation/graphics/ofGraphics.html#!show_ofLine
	}
	
	//--------------
	//Stripe image

	//Convert the sound buffer graph to the appropriate display size
	/* B/c w (width of sound viz) < N (size of buffer), we must scale the buffer
	 display with formula: i = float( x) * N / w
	 */
	for (int x=0; x<w; x++) {
		int i = float(x) * N / w;   //Convert x to buffer's position
		float v = buffer[i];		//Get buffer value
		
		//Apply square-root transformation
		//and also shift by 0.2 to make the picture brighter
		v = ofSign( v ) * sqrt( fabs( v ) ) + 0.2;
		
		//Convert v to range [0,255]
		float col = ofMap( v, -1, 1, 0, 255, true );
		
		//Set color and draw vertical line
		ofSetColor( col, col, col );
		ofLine( x, 200, x, 300 );
	}
}


//--------------------------------------------------------------
//AUDIO INPUT

void ofApp::audioReceived(float *input, int bufferSize, int nChannels ) {
	//If recording is enabled by the user, store received data
	if ( recordingEnabled ) {
		for (int i=0; i<bufferSize; i++) {
			buffer[ recPos ] = input[i];
			recPos++;
			//When the end of buffer is reached, recPos sets
			//to 0, so we record sound in a loop
			recPos %= N;
		}
	}
}

/* HC NOTES
 from textbook & http://openframeworks.cc/documentation/sound/ofSoundStream.html
 
 This is the fx that actually processes the sound.
 
Values of input lie in the range from -1.0 to 1.0.
The size of the input is equal to the bufferSize * nChannels, 
and samples in the channels are interleaved.
 
The audioIn() method is called whenever the system microphone detects sound: 
 void audioIn(float * input, int bufferSize, int nChannels) input Is a pointer 
 to the array of data. bufferSize - Is the size of the buffer, the number of 
 floating-point values in the input array. nChannels - Is the number of sound 
 channels represented in the sound data.
 
 
 */

//--------------------------------------------------------------
//AUDIO OUTPUT

void ofApp::audioOut(float *output, int bufferSize, int nChannels) {
	//If playing is enabled by the user, then do output sound
	if ( playingEnabled ) {
		for (int i=0; i<bufferSize; i++) {
			output[ 2*i ] = output[ 2*i+1 ]
			= buffer[ playPos ] * volume;
			playPos++;
			//When the end of buffer is reached, playPos sets
			//to 0, so we hear looped sound
			playPos %= N;
		}
	}
}


//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	
	//Enable recording mode
	if ( key == '1' ) {
		recordingEnabled = 1; playingEnabled = 0;
	}
	
	//Enable playing mode
	if ( key == '2' ) {
		recordingEnabled = 0; playingEnabled = 1;
	}
	
	//Save screen image to the file
	if ( key == 's' ) {
		ofImage grab;
		grab.grabScreen( 0, 0, ofGetWidth(), ofGetHeight() );
		grab.saveImage( "grab.png" );
	}
	
	//Write the sound sample to raw-file
	if ( key == 'f' ) {
		//Create a file for writing
		//Here "wb" means that we open binary file for writing
		FILE *file = fopen( ofToDataPath("sound.raw").c_str(), "wb" );
		//Write the buffer into file
		fwrite( &buffer[0], N, sizeof( buffer[0] ), file );
		
		//Close the file
		fclose( file );
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
