Dog snoopy, ginger, ralph;

void setup() {
  snoopy = new Dog("Snoopy", "male", "beagle", 20, false);
  ginger = new Dog("Ginger", "female", "rottweiler", 50, true);
  ralph = new Chihuahua("Ralph", "male", 4, 3);
  
  println(snoopy);
  println(ginger);
  println(ralph);
  
  snoopy.bark();
  ginger.bark();
  ralph.bark();
  
  exit();
}