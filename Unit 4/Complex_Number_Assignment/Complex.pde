class Complex {
  float a, b;

  Complex(float a, float b) {
    this.a = a;
    this.b = b;
  }

  String toString() {
    String repr;
    if (this.a == 0) {
      if (this.b == 0)
        repr = "0";

      if (this.b == 1)
        repr = "i";

      else if (this.b == -1)
        repr = "-i";

      else
        repr = floatToString(this.b) + "i";
    }
    else {
      repr = floatToString(this.a);

      if (this.b == 1)
        repr += " + i";

      else if (this.b == -1)
        repr += " - i";

      else if (this.b > 0)
        repr += " + " + floatToString(this.b) + "i";

      else if (this.b < 0)
        repr += " - " + floatToString(-this.b) + "i";
      // the "else" case is this.b == 0, and there is nothing more to add onto the repr for that case.
    }

    return repr;
  }

  private String floatToString(float x) {
    // Cleans up the output so that it returns:
    //   for integers, ex. "3" instead of "3.0"
    //   for non-integers, rounds to 3 decimal places
    if (x % 1 == 0)
      return str(int(x));
    else
      return nf(x, 1, 3);
  }

  void display() {
    println(this.toString());
  }

  float abs() {
    return sqrt(pow(this.a, 2) + pow(this.b, 2));
  }

  Complex add(Complex other) {
    float newA = this.a + other.a;
    float newB = this.b + other.b;
    return new Complex(newA, newB);
  }

  Complex multiply(float s) {
    return new Complex(this.a * s, this.b * s);
  }

  Complex multiply(Complex other) {
    float newA = this.a * other.a - this.b * other.b;
    float newB = this.a * other.b + this.b * other.a;
    return new Complex(newA, newB);
  }

  Complex divide(Complex other) {
    return this.multiply(other.reciprocal());
  }

  Complex square() {
    float newA = this.a * this.a - this.b * this.b;
    float newB = 2 * this.a * this.b;
    return new Complex(newA, newB);
  }

  Complex conjugate() {
    return new Complex(this.a, -this.b);
  }

  Complex reciprocal() {
    float denom = this.a * this.a + this.b * this.b;
    float newA = this.a / denom;
    float newB = -this.b / denom;
    return new Complex(newA, newB);
  }
}
