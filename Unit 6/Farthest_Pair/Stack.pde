class Stack<E> extends ArrayList<E> {

  void push(E e) {
    this.add(e);
  }
  E pop() {
    // Removes and returns the top element
    return this.remove(this.size() - 1);
  }
  E peek() {
    // Returns the top element, without removing it
    return this.peek(0);
  }
  E peek(int i) {
    // Returns the i-th element from the top (i=0 is the top element).
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