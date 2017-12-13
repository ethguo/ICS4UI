public class MixedFraction {
  int whole;
  Fraction frac;

  MixedFraction(int whole, int numerator, int denominator) {
    this.whole = whole;
    this.frac = new Fraction(numerator, denominator);
  }

  MixedFraction(float x) {
    this.whole = int(x);

    float decimal = x % 1;
    int decimalPlaces = str(x).length() - 2;
    
    int denom = int(pow(10, decimalPlaces));
    int num = int(decimal * denom);
    this.frac = new Fraction(num, denom);
    this.frac.reduce();
  }

  // Converts from improper Fraction to MixedFraction
  MixedFraction(Fraction f) {
    this.whole = f.numerator / f.denominator;
    int num = f.numerator % f.denominator;
    this.frac = new Fraction(num, f.denominator);
  }

  float toDecimal() {
    return this.whole + this.frac.toDecimal();
  }

  void display() {
    String sWhole = str(this.whole);
    String sNum = str(this.frac.numerator);
    String sDenom = str(this.frac.denominator);
    println(sWhole + " " + sNum + "/" + sDenom);
  }

  Fraction toImproper() {
    int newNum = this.frac.numerator + whole * this.frac.denominator;
    return new Fraction(newNum, this.frac.denominator);
  }

  MixedFraction multiply(MixedFraction other) {
    Fraction thisImproper = this.toImproper();
    Fraction otherImproper = other.toImproper();

    Fraction newFrac = thisImproper.multiply(otherImproper);

    return new MixedFraction(newFrac);
  }
}
