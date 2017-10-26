class Complex {
  float a, b;

  Complex(float a, float b) {
    this.a = a;
    this.b = b;
  }

  void toString() {
    String repr;
    if (this.a == 0) {
      if (this.b == 0)
        repr = "0";

      if (this.b == 1)
        repr = "i";

      else if (this.b == -1)
        repr = "-i";

      else
        repr = str(this.b) + "i";
    }
    else {
      repr = str(this.a);

      if (this.b == 1)
        repr += " + i";

      else if (this.b == -1)
        repr += " - i";

      else if (this.b > 0)
        repr += " + " + str(this.b) + "i";

      else if (this.b < 0)
        repr += " - " + str(-this.b) + "i";
      // else is this.b == 0, and there is nothing more to add onto the repr for that case.
    }

    return repr;
  }

  void display() {
    println(this.toString());
  }

  Complex multiply(float s) {
    return new Complex(this.a * s, this.b * s);
  }

  Complex add(Complex other) {
    float newA = this.a + other.a;
    float newB = this.b + other.b;
    return new Complex(newA, newB);
  }

  Complex multiply(Complex other) {
    float newA = this.a * other.a - this.b * other.b;
    float newB = this.a * other.b + this.b * other.a;
    return new Complex(newA, newB);
  }

  Complex square() {
    float newA = pow(this.a, 2) - pow(this.b, 2);
    float newB = 2 * this.a * this.b;
    return new Complex(newA, newB);
  }

  float abs() {
    return sqrt(pow(this.a, 2) + pow(this.b, 2));
  }
}
