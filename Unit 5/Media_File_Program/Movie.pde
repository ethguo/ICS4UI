class Movie extends MediaFile {  //Movie is a subclass of MediaFile

  //These are the only 2 fields of the Movie class that are not already contained in its superclass.
  String director;
  String leadActor;

  Movie(String t, String g, int l, int r, String dir, String la) 
  {
    // The method super() sets the fields that are common to all MediaFile objects
    // by calling the MediaFile constructor
    super(t, g, l, r);     

    // Sets the field values that are particular to Movie objects
    this.director = dir;    
    this.leadActor = la;
  }

  void describe()
  {
    super.describe(); //calls the superclass's describe() method

    System.out.println("Director: " + this.director);
    System.out.println("Starring: " + this.leadActor );
  }

  void play()
  {
    //code that will play a movie
  }
}