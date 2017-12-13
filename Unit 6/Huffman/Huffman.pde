byte[] data = "abcde abcd abc ab a".getBytes("UTF-8");

Node tree;

void setup() {
  for (int i = 0; i < data.length(); i++) {
    println(data[i]);
  }
}