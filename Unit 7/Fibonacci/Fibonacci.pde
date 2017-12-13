long numAdditions = 0;

long fibonacci(int n) {
  long tnminus2 = 0;
  long tnminus1 = 1;
  long tn = 1;
  for (int i = 0; i < n; i++) {
    numAdditions++;
    tn = tnminus2 + tnminus1;
    tnminus2 = tnminus1;
    tnminus1 = tn;
  }
  return tn;
}


void test( int range ) {
  for (int i = 0; i <= range; i++) {
    println("Fibonacci number " + i + " is " + fibonacci(i) + "\t\t\t Additions performed: " + numAdditions );
    numAdditions = 0;
  }
}


void setup(){
  int range = 500;

  test( range );
}