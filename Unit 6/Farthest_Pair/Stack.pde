class Stack<E> extends ArrayList<E> {
  void pop() {
    this.remove(this.size() - 1);
  }
  void push(E e) {
    this.add(e);
  }
  E peek() {
    return this.peek(0);
  }
  E peek(int i) {
    return this.get(this.size() - 1 - i);
  }
}