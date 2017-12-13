static class Fraction {
    
    //FIELDS
    int numerator;
    int denominator; 
    String label;
    
        
    //CONSTRUCTOR 1
    Fraction( int n, int d ) {
        this.numerator = n;
        this.denominator = d;
        this.label = "";
    }
    
    
    //CONSTRUCTOR 2
    Fraction( int n, int d, String l ) {
        this.numerator = n;
        this.denominator = d;
        this.label = l;
    }
    
    
          //ADD A 3rd CONSTRUCTOR THAT LETS THE USER CREATE A FRACTION FROM A DECIMAL. 
          //FOR EXAMPLE, Fraction f = new Fraction(0.375)  WOULD SET f TO 3/8.
          //HINT: MAKE USE OF THE reduce() METHOD AT THE END.
    

    //CLASS METHODS
    void display() {         
        String printedFrac = this.numerator + "/" + this.denominator; //IMPROVE THIS SO THAT ONLY THE NUMERATOR GETS PRINTED IF THE DENOMINATOR = 1
        
        if ( label.equals("") )
            println( printedFrac );
        
        else
            println( label + " = " + printedFrac );   
    }
    
    
    void reduce() {
        int gcd = getGCD( numerator, denominator );
        numerator /= gcd;
        denominator /= gcd;       
    }
    
    
    float toDecimal() {
        return (float) numerator/denominator; //casting to float is needed to prevent Java from dropping the decimal
    }
    
    
    //USED FOR SETTING THE LABEL OF FRACTIONS THAT WERE CREATED BY ADDING OR MULTIPLYING OTHER FRACTIONS, INSTEAD OF A CALL TO A CONSTUCTOR. 
    void setLabel( String name ) {
        this.label = name;
    }
    
    
    //METHODS THAT RETURN A NEW FRACTION OBJECT
    Fraction reciprocal() {
        Fraction recip = new Fraction( denominator, numerator );
        return recip;
    }
    
    
    Fraction multiply( Fraction other ) {
        int n1 = this.numerator;
        int d1 = this.denominator;
        
        int n2 = other.numerator;
        int d2 = other.denominator;
        
        return new Fraction( n1*n2, d1*d2);
    }
    
    
    Fraction multiplyByInteger( int i ) {
        int newNumerator = numerator * i;
        
        return new Fraction( newNumerator, denominator);
    }
    
    //CODE THE divide() METHOD HERE. MAKE USE OF THE reciprocal() AND multiply() METHODS ABOVE
    
  
    Fraction add( Fraction other ) {
        int n1 = this.numerator;
        int d1 = this.denominator;
        
        int n2 = other.numerator;
        int d2 = other.denominator;
        
        int lcd = getLCM(d1, d2);

        int newNumerator = n1 * d2 + n2 * d1;
        
        return new Fraction(newNumerator, lcd);
    }
    
    
    Fraction power( int exponent ) {
        int n = 1;
        int d = 1;
        if (exponent > 0) {
            n = (int) pow(this.numerator, exponent);
            d = (int) pow(this.denominator, exponent);
        }
        else if (exponent < 0) {
            n = (int) pow(this.denominator, -exponent);
            d = (int) pow(this.numerator, -exponent);
        }
        // if exponent == 0, n = 1 and d = 1

        return new Fraction(n, d);
    }
    
    
    //The following 4 methods are "static". 
    //This means that the user doesn't have to create a new Fraction object to use them.
    //Static methods are just "helper methods" that don't require information about any particular Fraction object.
    //To call a static method inside main, you use <CLASS NAME>.<METHOD NAME> instead of <OBJECT VARIABLE NAME>.<METHOD NAME>  
    //For example, Fraction.decimalToFraction(0.33)
    static int getGCD(int a, int b) {
        int max, min, rem;
        
        max = Math.max(a, b);
        min = Math.min(a, b);
        
        rem = max % min;
        
        while (rem > 0) {
            max = min;
            min = rem;
            rem = max % min;
        }
        
        return min;
    }
    
    
    static int getLCM(int a, int b) {
        int gcd = getGCD(a, b);

        return a * b / gcd;
    }
    
    
    static Fraction decimalToFraction( float d ) {
        
        float numerator = d;
        int denominator = 1;
        
        while ( ! isWholeNumber(numerator) ) {
            numerator *= 10;
            denominator *= 10;
        } 
        
        int numer = (int) numerator;
        
        Fraction f = new Fraction(numer, denominator);
        f.reduce();
        
        return f;
    }
    
    
    //This method is "private" instead of "public" because it's only needed by other methods in the class, and not by setup().
    //The user has no access to it from setup().
    private static boolean isWholeNumber( float d ) {
        return d == Math.round(d);
    }
    
} //END OF FRACTION CLASS