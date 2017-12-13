void setup() {
  //MAKE SEVERAL SONG OBJECTS. THEY'RE NOT ON ANY PLAYLISTS JUST YET
  Song s1 = new Song( "Mah Dawg Drank Mah Beer", "Daniel Nova", 2, "7:41");
  Song s2 = new Song( "Don't You Mess with Vectors", "Garth Brooks", 3, "2:59");
  Song s3 = new Song( "Luv You With All My Seoul", "Liang & Mao", 3, "4:05");
  Song s4 = new Song( "Yo! Factor This!", "Math Attack Schatt", 1, "12:02");
  Song s5 = new Song( "Pytha-korean Theorem", "Math Attack Schatt", 0, "3:15");

  //CREATE SOME EMPTY PLAYLISTS
  PlayList cw = new PlayList( "Country Western Favourites" );
  PlayList math = new PlayList( "Math Hits 2017" );
  PlayList kPop = new PlayList( "KPop Dance Hits" );

  //ADD SONG OBJECTS TO PLAY LISTS
  //THE SAME SONG OBJECT CAN BE ON MULTIPLE PLAYLISTS
  cw.addSong( s1 );
  cw.addSong( s2 );
  math.addSong( s2 );
  math.addSong( s4 );
  math.addSong( s5 );
  kPop.addSong( s3 );
  kPop.addSong( s5 );

  //PRINT THE PLAY LISTS BEFORE PLAYING ANY SONGS
  cw.printPlayList();
  math.printPlayList();
  kPop.printPlayList();

  //PLAY SEVERAL SONGS, SOME OF THEM MULTIPLE TIMES (BECAUSE WE JUST LOVE THEM SO MUCH!)
  s2.play();
  s1.play();
  s1.play();
  s1.play();
  s1.play();
  s2.play();
  s2.play();
  s5.play();

  //PRINT THE PLAYLISTS AGAIN. WHAT'S DIFFERENT THIS TIME?       
  cw.printPlayList();
  math.printPlayList();
  kPop.printPlayList(); 
  
  exit();
}