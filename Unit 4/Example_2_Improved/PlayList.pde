class PlayList {

    //FIELDS
    String title;
    int numSongs;
    Song[] songs;
    int maxSize = 100; //static means this value is the same for all objects of this class
    

    //CONSTRUCTOR METHOD (NEEDED IF THE OBJECT TAKES ARGUMENTS TO GET BUILT)
    PlayList( String t ) {
        title = t;
        numSongs = 0;
        songs = new Song[ maxSize ];
    }
    
    
    //METHODS
    void printPlayList() {
        
        println("*****************************************");
        println( title + ": " + numSongs + " songs" + "\tTotal time: " + getDuration());
        println("*****************************************");
        
        for (int i = 0; i < numSongs; i++) {
            songs[i].printInfo();   //we're making this up for now.  We'll code it later         
        }
        
        println("");
    }
    
    String getDuration() {
        int totalSec = 0;
        for (int i = 0; i < numSongs; i++) {
            String d = songs[i].duration;
            totalSec += timestampToSeconds(d);
        }
        return secondsToTimestamp(totalSec);
    }
    
    void addSong( Song s ) {  //What if numSongs is already at 100?
        songs[ numSongs ] = s;
        numSongs++;
    }
   
}

 
int timestampToSeconds(String timestamp) {
    int iColon = timestamp.indexOf(":");
    String sMin = timestamp.substring(0, iColon);
    String sSec = timestamp.substring(iColon + 1);
    int min = parseInt(sMin);
    int sec = parseInt(sSec);
    return 60*min + sec;
}

String secondsToTimestamp(int seconds) {
    int min = seconds / 60;
    int sec = seconds % 60;
    return "" + min + ":" + nf(sec, 2);
}
