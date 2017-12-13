void setup() {
  Complex z1 = new Complex(2, 3);
  Complex z2 = new Complex(-5, -8);
  Complex z3 = new Complex(0, 1);
  Complex z4 = new Complex(6, 0);

  expect("2 + 3i");
  z1.display();
  expect("-5 - 8i");
  z2.display();
  expect("i");
  z3.display();
  expect("6");
  z4.display();

  String repr = z1.toString();
  expect("2 + 3i");
  println(repr);

  float abs1 = z1.abs();
  expect("3.606");
  println(abs1);
  float abs2 = z2.abs();
  expect("9.434");
  println(abs2);
  float abs3 = z3.abs();
  expect("1");
  println(abs3);

  Complex sum1 = z1.add(z2);
  expect(sum1, "-3 - 5i");
  Complex sum2 = z3.add(z4);
  expect(sum2, "6 + i");

  Complex product = z1.multiply(4);
  expect(product, "8 + 12i");

  Complex product1 = z1.multiply(z2);
  expect(product1, "14 - 31i");
  Complex product2 = z3.multiply(z4);
  expect(product2, "6i");

  Complex quotient1 = z1.divide(z2);
  expect(quotient1, "-0.382 + 0.011i");
  Complex quotient2 = z3.divide(z4);
  expect(quotient2, "0.167i");

  Complex square = z1.square();
  expect(square, "-5 + 12i");

  Complex conjugate = z1.conjugate();
  expect(conjugate, "2 - 3i");

  Complex reciprocal = z1.reciprocal();
  expect(reciprocal, "0.154 - 0.231i");

  exit();
}

void expect(String expected) {
  print("Should print \"" + expected + "\":  ");
}

void expect(Object value, String expected) {
  String sValue = value.toString();
  if (sValue.equals(expected))
    print("[OK]");
  else
    print("[X] ");
  print(" Should print \"" + expected + "\":  ");
  println(sValue);
}
