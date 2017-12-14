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
    // Draw this "vector" as an (x, y) point.
    noStroke();
    fill(colour);
    ellipse(this.x, height-this.y, 5, 5);
  }

  boolean isBefore(Vector other) {
    // The condition used to sort Vectors, in order of ascending x-coordinates, or y-coordinates in case of ties.
    return (this.x < other.x) || (this.x == other.x && this.y <= other.y);
  }

  Vector minus(Vector other) {
    return new Vector(this.x - other.x, this.y - other.y);
  }
}