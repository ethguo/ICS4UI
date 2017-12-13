long numBubbleSortComparisons, numInsertionSortComparisons, numSelectionSortComparisons, numMergeSortComparisons;
long bubbleSortTime, insertionSortTime, selectionSortTime, mergeSortTime;
long startTime, elapsedTime;

// int n = 10;  //ARRAY SIZE
boolean printArrays = false;


void swap( int[] a, int x, int y ) {
  int c = a[x];
  a[x] = a[y];
  a[y] = c;
}


int[] bubbleSort( int[] a ) {
  int n = a.length;

  for ( int p = 1; p <= n-1; p++ ) {

    for ( int i = 0; i <= n-p-1; i++ ) {

      if ( a[i] > a[i + 1] ) 
        swap( a, i, i+1 );

      numBubbleSortComparisons++;
    }
  }
  return a;
}


int[] insertionSort( int[] a ) {
  int n = a.length;

  for ( int h = 1; h <= n-1; h++ ) {

    int j = h; 

    while ( j > 0 && a[j] < a[j-1] ) {
      swap( a, j, j-1 );
      j--;

      numInsertionSortComparisons++;
    }
  }
  
  return a;
}


int[] selectionSort( int[] a ) {
  int n = a.length;

  for (int i = 0; i < n; i++) {

    int indexOfMin = i;

    for ( int j = i+1; j < n; j++ ) {
      if ( a[ j ] < a[ indexOfMin ] ) 
        indexOfMin = j; 

      numSelectionSortComparisons++;
    }

    swap( a, i, indexOfMin );
  }
  
  return a;
}


int[] mergeSort(int[] array, int start, int end ) {
  if (start == end) {  
    int[] arrayWithOneElement = { array[start] };
    return arrayWithOneElement;
  } 
  
  else {
    int middle = (end + start) / 2;

    int[] sortedLeftHalf = mergeSort(array, start, middle);         // recursive call
    int[] sortedRightHalf = mergeSort(array, middle + 1, end);      // recursive call

    return mergeTwoSortedLists( sortedLeftHalf, sortedRightHalf );  // merge the two sorted halves
  }
}


int[] mergeTwoSortedLists(int[] a, int[] b) {
  int[] c = new int[a.length + b.length];
  int i = 0;
  int j = 0;
  int k = 0;

  int lenA = a.length, lenB = b.length;

  while ( i < lenA && j < lenB ) {

    if ( a[i] <= b[j] ) {
      c[k] = a[i];
      i++;
    } 
    else {
      c[k] = b[j];
      j++;
    }

    k++;
    numMergeSortComparisons += 3;
  }

  if ( i == lenA ) 
    for (int m = j; m < b.length; m++) {
      c[k] = b[m];
      k++;
    } else 
  for (int m = i; m < a.length; m++) {
    c[k] = a[m];
    k++;
  }

  return c;
}


void printArrayInline(int[] a) {
  for (int i = 0; i < a.length; i++) 
    print(a[i] + " ");

  println("");
}


void testBubbleSort(int[] aCopy) {
  startTime = millis();

  int[] aSorted = bubbleSort( aCopy );
  bubbleSortTime = millis() - startTime; //the time bubblesort took

  if( printArrays) 
    printArrayInline( aSorted ); 
    
  // println( "Bubble sort made " + numBubbleSortComparisons + " comparisons and took " + bubbleSortTime + " milliseconds");
}


void testInsertionSort(int[] aCopy) {
  startTime = millis();

  int[] aSorted = insertionSort( aCopy );
  insertionSortTime = millis() - startTime; //the time bubblesort took

  if( printArrays) 
    printArrayInline( aSorted ); 
    
  // println( "Insertion sort made " + numInsertionSortComparisons + " comparisons and took " + insertionSortTime + " milliseconds");
}


void testSelectionSort(int[] aCopy) {
  startTime = millis();

  int[] aSorted = selectionSort( aCopy );
  selectionSortTime = millis() - startTime; //the time bubblesort took

  if( printArrays) 
    printArrayInline( aSorted ); 
  // println( "Selection sort made " + numSelectionSortComparisons + " comparisons and took " + selectionSortTime + " milliseconds");
}


void testMergeSort(int[] aCopy) {
  startTime = millis();

  int[] aSorted = mergeSort( aCopy, 0, aCopy.length - 1 );
  mergeSortTime = millis() - startTime; //the time bubblesort took

  if( printArrays) 
    printArrayInline( aSorted ); 
  // println( "Merge sort made " + numMergeSortComparisons + " comparisons and took " + mergeSortTime + " milliseconds");
}


void setup() {
  for (int n : new int[] {10, 20, 30, 100, 200, 300, 1000, 2000, 3000, 10000, 20000, 30000, 100000, 200000, 300000}) {
    println("------------------------------------------------------------");
    println(n);

    int[] a, aCopy1, aCopy2, aCopy3;

    // if (n < 50) 
    //   printArrays = true;
    // else
    //   printArrays = false;

    //MAKE A RANDOM ARRAY OF LENGTH n
    a = new int[ n ];
    
    for ( int i = 0; i < a.length; i++ )  
      a[ i ] = int(random( n*5 ));      

    //MAKE 3 COPIES OF THE ORIGINAL ARRAY
    aCopy1 = a.clone();
    aCopy2 = a.clone();
    aCopy3 = a.clone();

    //PRINT THE ORIGINAL ARRAY
    if (printArrays) {
      println("The original array");
      printArrayInline( a ); 
      println("");
    }

    // testBubbleSort( a );
    testInsertionSort( aCopy1 );      
    // testSelectionSort( aCopy2 );
    testMergeSort( aCopy3 );

    //GIVE THE PERFORMANCE RATIO
    double performanceRatio = (double) numInsertionSortComparisons / numMergeSortComparisons;
    println( "Insertionsort needed " + performanceRatio + " times as many comparisons as mergesort.");
  }
}