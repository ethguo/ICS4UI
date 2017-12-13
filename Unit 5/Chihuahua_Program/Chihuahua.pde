class Chihuahua extends Dog {
  
  int numSweaters;
  
  Chihuahua(String n, String g, int w, int ns) {
    super(n, g, "chihuahua", w, false);
    this.numSweaters = ns;
    this.emoState = "nervous";
  }
  
  String toString() {
    String description = super.toString();
    description += " " + this.name + " owns " + this.numSweaters + " sweaters.";
    return description;
  }
  
  
  void bark() {
    println("Yipe! said " + this.name);
  }
  
  
  void chewSweater() {
    this.numSweaters = max(0, this.numSweaters - 1);
  }
}