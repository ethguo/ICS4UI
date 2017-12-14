class Vector extends PVector {
  color colour;

  Vector(int x, int y) {
    super(x, y);
    this.colour = #FFFFFF;
  }

  Vector(float x, float y) {
    super(x, y);
    this.colour = #FFFFFF;
  }

  String toString() {
    return "(" + nf(this.x) + ", " + nf(this.y) + ")";
  }

  void drawPoint() {
    noStroke();
    fill(colour);
    ellipse(this.x, height-this.y, 5, 5);
  }

  boolean isBefore(Vector other) {
    return (this.x < other.x) || (this.x == other.x && this.y <= other.y);
  }

  Vector minus(Vector other) {
    return new Vector(this.x - other.x, this.y - other.y);
  }
}