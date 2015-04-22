import java.util.Hashtable;
import java.io.FilenameFilter;

public class FindWordsAndVideos {

  // Hashtable contains words and their position.
  private Hashtable<String, PVector> words;

  File folder;
  File videoFile;

  public String absoluteWordsFolder = absolutePath+wordsFolder;
  public String videosPath = "";

  // Constructor
FindWordsAndVideos() {
    this.words = new Hashtable<String, PVector>();
    ;
  }

  // Searches for folders in the Words folder.
  // Each folder represents a word.
  // Chooses a random word
  // Searches for videos files
  // Chooses a random video
  //returns a String with the word and the name of the video selected
  
  public String  setWordsFromFolder() {

    File[] videoFiles;
    File[] folders;

    int whichFile = 0;
    int whichWord = 0;
    do {
      folder = new java.io.File(dataPath(absoluteWordsFolder));
      folders = folder.listFiles(folderFilter);

      whichWord = int(random(0, 9));


      videosPath = absolutePath+wordsFolder+ folders[whichWord].getName();

      videoFile = new java.io.File(dataPath(videosPath));
      videoFiles = videoFile.listFiles(folderFilter);

      println(videosPath); 
      println("quantidade de video: "+videoFiles.length);
    }
    while (videoFiles.length<=0);

    whichFile = int(random(0, videoFiles.length));
    println("video sorteado: "+ whichFile);
    println(folders[whichWord].getName()+"/"+whichFile);

    return folders[whichWord].getName()+"/"+whichFile;

  }


  final FilenameFilter folderFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      if (!name.toLowerCase().startsWith("."))
        return true;
      return false;
    }
  };
}

