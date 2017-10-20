class Song {
  //FIELDS OF THE SONG CLASS

  String title;
  String artist;
  int starRating;  //whole numbers of stars only. Challenge: Change the class so you can fractions or decimals of stars.
  String duration;
  int numPlays;


  //CONSTRUCTOR. CONSTRUCTOR PROCEDURES HAVE NO RETURN TYPE, NOT EVEN VOID
  Song( String t, String a, int stars, String d ) {
    this.title = t;
    this.artist = a;
    this.starRating = stars;
    this.duration = d;
    this.numPlays = 0;  //we can also set a field value to some arbitrary value; the value doesn’t have to be passed as an argument
  }


  //PROCEDURES OF THE SONG CLASS
  void printInfo() {
    String starOutput = "";

    for (int i = 0; i < this.starRating; i++) 
      starOutput += "*";
    

    println( this.title + "\t" + " by " + this.artist + "\t" + starOutput + "\t played " + this.numPlays + " times");
  }


  void play() {
    this.numPlays++;
    //code for actually playing the song over the computer's speakers would go here
  }
}