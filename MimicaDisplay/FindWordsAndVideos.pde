import java.util.Hashtable;
import java.io.FilenameFilter;

public class FindWordsAndVideos {
  
  public String word = "";
  private int amountOfVideos=0;
  private String absoluteWordsFolder = absolutePath+wordsFolder;

public String getRandomVideoFolder(){
  setRandomFolder();
   return word;
}

  public String getRandomVideoFromFolder(){
    setRandomFolder();
    int whichFile = getRandomVideo();
    println(word+"/"+whichFile);
    return word+"/"+whichFile;
  }
  
  public String getRandomVideoFromSameFolder(){
    int whichFile = getRandomVideo();
    println(word+"/"+whichFile);
    return word+"/"+whichFile;
  }
  
  public void getAmountOfVideos(){
    File videoFolder;
    File[] videoFiles;
    String videosPath = "";
    
    do {      
      videosPath = absolutePath+wordsFolder+word;
      videoFolder = new java.io.File(dataPath(videosPath));
      videoFiles = videoFolder.listFiles(oggFilter);
      
      amountOfVideos=videoFiles.length;

      println(videosPath); 
      println("quantidade de videos: "+amountOfVideos);
    }
    while (amountOfVideos<=0);
    
  }

  public void setRandomFolder() {
    File videoFolder;
    File[] videoFiles;
    String videosPath = "";
    
    do {
      setRandomWord();
      
      videosPath = absolutePath+wordsFolder+word;
      videoFolder = new java.io.File(dataPath(videosPath));
      videoFiles = videoFolder.listFiles(oggFilter);
      
      amountOfVideos=videoFiles.length;

      println(videosPath); 
      println("quantidade de videos: "+amountOfVideos);
    }
    while (amountOfVideos<=0);

  }

  // Chooses a random word from folder list
  // Chosses from only the first 10 folders.
  public void setRandomWord() {
    
      File folder;
      String randomWord="";
      File[] folders;
      folder = new java.io.File(dataPath(absoluteWordsFolder));
      folders = folder.listFiles(folderFilter);
      randomWord=folders[int(random(0, 9))].getName();
      word=randomWord;
  }
  
  public void setWord(String w){
      word=w;
  }
  
  public void setFolder(){
    
  }
  
  public int getRandomVideo(){
    
    int whichFile = int(random(0, amountOfVideos));
    println("video sorteado: "+ whichFile);
    
    return whichFile;
  }


  final FilenameFilter folderFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      if (!name.toLowerCase().startsWith("."))
        return true;
      return false;
    }
  };
  
  final FilenameFilter oggFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      if (name.toLowerCase().endsWith(".ogg"))
        return true;
      return false;
    }
  };
}
