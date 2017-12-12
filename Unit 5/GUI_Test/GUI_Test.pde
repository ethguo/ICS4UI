// Need G4P library
import g4p_controls.*;

float speed = 3;

float x, y;
float xSpeed, ySpeed;

public void setup(){
  size(400, 400, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
  fill(#00FF00);
  x = width/2;
  y = height/2;
  xSpeed = 0;
  ySpeed = 0;
}

public void draw(){
  background(230);
  
  x += xSpeed * speed;
  y += ySpeed * speed;
  
  ellipse(x, y, 10, 10);
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}