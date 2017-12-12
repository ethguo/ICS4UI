class MediaFile { //the superclass

  String title;  //These are the 4 fields that are common to both
  String genre;  //Songs and Movies 
  int length;
  int rating;

  MediaFile( String t, String g, int l, int r ) {
    this.title = t;
    this.genre = g;
    this.length = l;
    this.rating = r;
  }

  void describe() {
    println("****************");
    println("Title: " + title);
    println("Genre: " + genre);
    println("Length: " + length);
    println("Rating: " + rating);
  }
}