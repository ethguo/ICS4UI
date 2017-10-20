float xMin = -3.0;
float xMax =  1.0;
float yMin = -2.0;
float yMax =  2.0;

float xRes = 0.005;
float yRes = 0.005;

float xScaling;
float yScaling;

void setup() {
  size(800, 800);
  noLoop();

  stroke(255);

  xScaling = width / (xMax - xMin);
  yScaling = height / (yMax - yMin);
}

void draw() {
  ComplexNumber z;
  for (float b = yMin; b <= yMax; b += yRes) {
    for (float a = xMin; a <= xMax; a += xRes) {
      z = ComplexNumber(a, b);
      
    }
  }
}

int getScreenX(float a) {
  return int((a - xMin) * xScaling);
}

int getScreenY(float b) {
  return int((b - yMin) * yScaling);
}