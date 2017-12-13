import g4p_controls.*;

//USER OPTIONS
String markerMovement = "mouse";    //"sinusoidal", "circular", "figure8", "mouse"
float wheelRotationalFreq  = 0.02;  //How fast the white board spins
float markerMotionFreq = 0.08;      //How frequently the marker goes through its motion cycle
float amplitude = 125;               //The range of the marker's motion
float xCentrePercent = 0.5;         //The center of the motion, as a percentage of the screen size
float yCentrePercent = 0.33;  
color markerColour = color(255, 0, 0);

//DECLARING THE OBJECTS
Marker myMarker = new Marker( markerMovement, markerMotionFreq, amplitude, xCentrePercent, yCentrePercent, markerColour );
ArrayList<MarkerPoint> points;
MarkerPoint[] edgePoints;

//OTHER GLOBAL VARIABLES
int numEdgePoints = 8;
PVector center;
boolean paused = false;
boolean mouseDown = false;
float t = 0;
float wheelRadius;


//MAIN PROCEDURE
void setup(){
  size(500,500);
  createGUI();
  center = new PVector(width/2, height/2);
  wheelRadius = width/2.1;
  background(0);
  noStroke();
  
  points = new ArrayList<MarkerPoint>();
  edgePoints = new MarkerPoint[10];
  
  createEdgePoints();
}


void clearScreen() {
  points = new ArrayList<MarkerPoint>();
}


void createEdgePoints() {
  float theta = 0;
  for (int i=0; i<numEdgePoints; i++){
    float x = width/2 + wheelRadius*cos(theta);
    float y = width/2 - wheelRadius*sin(theta);
    edgePoints[i] = new MarkerPoint( x, y, center, color(0,0,255), 10);
    theta += 2*PI/numEdgePoints;
  }
}


//DRAWING PROCEDURE
void draw() {
  if (paused == false) {
    background(0);
    fill(255);
    ellipse(width/2, height/2, wheelRadius*2, wheelRadius * 2);
    
    fill( myMarker.colour );
    stroke( myMarker.colour );
    strokeWeight(3);
    
    //Draws and rotates the curve created so far
    for(int i=0; i<points.size(); i++) {
      MarkerPoint mp = points.get(i);
      
      if (myMarker.motionType.equals("mouse"))
          mp.drawMe();
          
      else if(i > 0) { //Draws a short line between the current point and the previous point on the curve
          MarkerPoint mp_prev = points.get(i-1);
          line( mp.location.x, mp.location.y, mp_prev.location.x, mp_prev.location.y );
        }
           
      mp.rotate( wheelRotationalFreq );  
    }
    
    
    //Draws and rotates the blue edge points
    for(int i=0; i < numEdgePoints; i++) {
      edgePoints[i].drawMe();
      edgePoints[i].rotate( wheelRotationalFreq );
    }
    
    
    myMarker.updatePosition(); 
    MarkerPoint newMP;
    
    if (!myMarker.motionType.equals("mouse")) {  
        newMP = new MarkerPoint( myMarker.x, myMarker.y, center, myMarker.colour, 5); 
        points.add( newMP ); 
    }
    
    myMarker.drawMe();

    t++;
  }
}


void mouseDragged() {
  if (myMarker.motionType.equals("mouse")) {
    MarkerPoint newMP = new MarkerPoint(mouseX, mouseY, center, myMarker.colour, 10); 
    points.add( newMP );
  }
}