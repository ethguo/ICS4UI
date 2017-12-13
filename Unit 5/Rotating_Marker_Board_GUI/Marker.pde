class Marker {
  float x, y;
  float xSpeed, ySpeed;
  float frequency, amplitude;
  String motionType;  //"sinusoidal", "linear", "circular", "figure8", "mouse"
  float xCentrePercent, yCentrePercent;
  color colour;

  Marker(String mt, float fr, float amp, float xcp, float ycp, color col) {
    this.motionType = mt;
    this.frequency = fr;
    this.amplitude = amp;
    this.xCentrePercent = xcp;
    this.yCentrePercent = ycp;
    this.colour = col;
  }


  void updatePosition() {  
    float f = this.frequency;
    float A = this.amplitude;
    
    if ( this.motionType.equals("sinusoidal")) {
      this.x = width*this.xCentrePercent + A*sin(f * t);
      this.y = height*this.yCentrePercent;
    }
    
    else if (this.motionType.equals("circular")) { 
      this.x = width*this.xCentrePercent + A*cos( f * t);
      this.y = height*this.yCentrePercent + A*sin( f * t);
    }
    
    else if (this.motionType.equals("figure8")) { 
      this.x = width*this.xCentrePercent + A*sin( f * t);
      this.y = height*this.yCentrePercent + A*sin( 2 * f * t);
    } 
    
    else if (this.motionType.equals("mouse")) { 
      this.x = mouseX;
      this.y = mouseY;
    }
  }  
  
  
  void drawMe() {
    fill( this.colour );
    stroke(0);
    ellipse(this.x, this.y, 18, 18);
  }
}