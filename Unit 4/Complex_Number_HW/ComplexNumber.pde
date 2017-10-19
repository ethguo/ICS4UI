class ComplexNumber {
  float a, b;

  ComplexNumber(float a, float b) {
    this.a = a;
    this.b = b;
  }

  void display() {
    String output;
    if (this.a == 0) {
      if (this.b == 0)
        output = "0";

      if (this.b == 1)
        output = "i";

      else if (this.b == -1)
        output = "-i";

      else
        output = str(this.b) + "i";
    }
    else {
      output = str(this.a);

      if (this.b == 1)
        output += " + i";

      else if (this.b == -1)
        output += " - i";

      else if (this.b > 0)
        output += " + " + str(this.b) + "i";

      else if (this.b < 0)
        output += " - " + str(-this.b) + "i";
      // else is this.b == 0, and there is nothing more to add onto the output for that case.
    }

    println(output);
  }

  ComplexNumber add(ComplexNumber other) {
    float newA = this.a + other.a;
    float newB = this.b + other.b;

    return new ComplexNumber(newA, newB);
  }
}
