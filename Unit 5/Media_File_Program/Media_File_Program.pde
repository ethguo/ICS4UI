void setup() {
  MediaFile[] myEntertainment = new MediaFile[4];

  myEntertainment[0] = new Movie( "Despicable I", "Kids", 130, 5, "I.P. Nightly", "Tom Hanks");
  myEntertainment[1] = new Song( "Perhaps Love", "Elevator Sap", 2, 3, "John Denver & Placido Domingo", "Best of Elevator Muzak");
  myEntertainment[2] = new Song( "Quadratic Formula Rap", "Hip Hop", 0, 4, "Math Attack Schatt", "Math Rap Top 40");
  myEntertainment[3] = new Movie( "No Country For Old Men", "Drama", 5, 4, "Joel Coen", "Tommy Lee Jones");

  for (int i = 0; i < myEntertainment.length; i++) {
    myEntertainment[i].describe();  // Processing automatically detects which "describe" is needed for each item in the array
  }
}