class Stack<E> extends ArrayList<E> {

  void push(E e) {
    this.add(e);
  }
  E pop() {
    return this.remove(this.size() - 1);
  }
  E peek() {
    // returns the top element
    return this.peek(0);
  }
  E peek(int i) {
    // returns the i-th element from the top
    return this.get(this.size() - i - 1);
  }
  void reverse() {
    // Reverses the list in-place
    int n = this.size();
    for (int i = 0; i < n/2; i++) {
      E temp = this.get(i);
      this.set(i, this.get(n - i - 1));
      this.set(n - i - 1, temp);
    }
  }
}