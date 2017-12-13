void setup() {
  int[] a = {6, 1, 4, 9, 3, 2};
  pprint(a);
  bubbleSort(a);
  pprint(a);

  exit();
}

void bubbleSort(int[] a) {
  for (int p = 1; p < a.length; p++) {
    for (int j = 0; j < a.length - p; j++) {
      if (a[j] > a[j+1]) {
        // Swap a[j], a[j+1]
        int temp = a[j];
        a[j] = a[j+1];
        a[j+1] = temp;
      }
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