void setup() {
  exit();

  int[] a = {6, 1, 4, 9, 3, 2};
  pprint(a);
  insertionSort(a);
  pprint(a);
}

void bubbleSort(int[] a) {
  for (int p = 1; p < a.length; p++) {
    for (int j = 0; j < a.length - p; j++) {
      if (a[j] > a[j+1]) {
        swap(a, j, j+1);
      }
    }
  }
}

void insertionSort(int[] a) {
  for (int i = 1; i < a.length; i++) {
    int j = i;
    while (j > 0 && a[j-1] > a[j]) {
      swap(a, j-1, j);
      j--;
    }
  }
}

void pprint(int[] a) {
  for (int x : a) {
    print(x);
    print(" ");
  }
  println();
}

int[] randomArray(int len) {
  int[] a = new int[len];
  for (int i = 0; i < len; i++) {
    a[i] = int(random(100));
  }
  return a;
}

void swap(int[] a, int i1, int i2) {
  int temp = a[i1];
  a[i1] = a[i2];
  a[i2] = temp;
}