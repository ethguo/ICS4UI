void setup() {
  ComplexNumber z1 = new ComplexNumber(3, 4);
  ComplexNumber z2 = new ComplexNumber(12.2, -1.5);
  ComplexNumber z3 = new ComplexNumber(0, 1);
  ComplexNumber z4 = new ComplexNumber(5, 0);
  ComplexNumber z5 = new ComplexNumber(0, -1);

  z1.display();    //should print 3 + 4i
  z2.display();    //could print 12.2 + -1.5i, but better is to print just 12.2 - 1.5i
  z3.display();    //could print 0 + 1i, but better is to print just i
  z4.display();    //could print 5 + 0i, but better is to print just 5
  z5.display();    //should print -i

  ComplexNumber sum1 = z1.add(z2);
  sum1.display();    //should print 15.2 + 2.5i

  ComplexNumber sum2 = z3.add(z4);
  sum2.display();    //should print 5 + i
}
