/**
  * This sketch demonstrates how to create synthesized sound with Minim 
  * using an AudioOutput and an Oscil. An Oscil is a UGen object, 
  * one of many different types included with Minim. By using 
  * the numbers 1 thru 5, you can change the waveform being used
  * by the Oscil to make sound. These basic waveforms are the 
  * basis of much audio synthesis. 
  * 
  * For many more examples of UGens included with Minim, 
  * have a look in the Synthesis folder of the Minim examples.
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;

boolean drawOutput = true;
int numOctaves = 4;
float lowestFreq = 110;
int bottomDeadZone = 100;

float pixelsPerOctave;
float pixelsPerSemitone;

void setup()
{
  size(1025, 400, P3D);
  frameRate(120);

  pixelsPerOctave = (width-1) / (float)numOctaves;
  pixelsPerSemitone = pixelsPerOctave / 12;
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil( 440, 0.0f, Waves.SINE );
  // patch the Oscil to the output
  wave.patch( out );
}

void draw()
{
  background(0);

  stroke(255, 0, 0);
  strokeWeight(1);

  for (int n = 0; n < numOctaves; n++) {
    float xOctave = n * pixelsPerOctave;

    stroke(255, 64, 64);
    strokeWeight(3);
    verticalLine(xOctave);

    stroke(64, 255, 64);
    strokeWeight(1);
    verticalLine(xOctave + 7 * pixelsPerSemitone);

    stroke(64, 64, 255);
    strokeWeight(1);
    verticalLine(xOctave + 2 * pixelsPerSemitone);
    verticalLine(xOctave + 4 * pixelsPerSemitone);
    verticalLine(xOctave + 5 * pixelsPerSemitone);
    verticalLine(xOctave + 9 * pixelsPerSemitone);
    verticalLine(xOctave + 11 * pixelsPerSemitone);

    stroke(128);
    strokeWeight(1);
    verticalLine(xOctave + 1 * pixelsPerSemitone);
    verticalLine(xOctave + 3 * pixelsPerSemitone);
    verticalLine(xOctave + 6 * pixelsPerSemitone);
    verticalLine(xOctave + 8 * pixelsPerSemitone);
    verticalLine(xOctave + 10 * pixelsPerSemitone);
  }

  // draw last octave line
  float xOctave = width-1;
  stroke(255, 0, 0);
  strokeWeight(3);
  verticalLine(xOctave);
  
  // draw the waveform of the output
  if (drawOutput) {
    stroke(255);
    strokeWeight(1);
    float y1, y2;
    y1 = (height - bottomDeadZone)/2 * (1 - out.left.get(0) / 2.0);
    for(int i = 1; i < out.bufferSize(); i++) {
      y2 = (height - bottomDeadZone)/2 * (1 - out.left.get(i) / 2.0);
      line(i, y1, i+1, y2);
      y1 = y2;
      // line( i, 50  - out.left.get(i)*50,  i+1, 50  - out.left.get(i+1)*50 );
      // line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
    }
  }

  // // draw the waveform we are using in the oscillator
  // stroke( 128, 0, 0 );
  // strokeWeight(4);
  // for( int i = 0; i < width-1; ++i ) {
  //   point( i, height/2 - (height*0.49) * wave.getWaveform().value( (float)i / width ) );
  // }
}

void mouseMoved()
{
  // usually when setting the amplitude and frequency of an Oscil
  // you will want to patch something to the amplitude and frequency inputs
  // but this is a quick and easy way to turn the screen into
  // an x-y control for them.
  
  float amp = constrain(map(mouseY, 0, height - bottomDeadZone, 1, 0), 0, 1);
  wave.setAmplitude( amp );
  
  float exp = mouseX / pixelsPerOctave;
  float freq = pow(2, exp) * lowestFreq;
  wave.setFrequency( freq );
}

void keyPressed()
{ 
  switch( key )
  {
    case '1': 
      wave.setWaveform( Waves.SINE );
      break;
     
    case '2':
      wave.setWaveform( Waves.TRIANGLE );
      break;
     
    case '3':
      wave.setWaveform( Waves.SAW );
      break;
    
    case '4':
      wave.setWaveform( Waves.SQUARE );
      break;
      
    case '5':
      wave.setWaveform( Waves.QUARTERPULSE );
      break;

    case 27: // ESC
      exit();
      break;
     
    default: break; 
  }
}

void verticalLine(float x) {
  x = int(x);
  line(x, 0, x, height - bottomDeadZone);
}