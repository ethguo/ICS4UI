void setup() {
  MixedFraction f = new MixedFraction( 1, 4, 5 );  //constructs the mixed fraction 1 45

  println( f.toDecimal() ); //prints “1.8”
  Fraction fImproper = f.toImproper();  //converts f to an improper fraction
  fImproper.display();  //prints 9/5

  MixedFraction g = new MixedFraction( 2.25 ); //constructs the mixed fraction 2 14
  MixedFraction fTimesg = f.multiply(g);  
  fTimesg.display(); //prints “4 1/20” since 1 45 × 2 14=4 120
}
