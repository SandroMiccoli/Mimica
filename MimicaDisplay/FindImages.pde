public class FindImages {

  File folder;


  FindImages() {
  }


  public int  getTotalImages(String imgsPath) {

    File[] imageFiles;
    //"D:/JP/Projetos/INSTALAÇÃO MÍMICA/test_random_images_metodo/data"
    folder = new java.io.File(dataPath(imgsPath));
    imageFiles = folder.listFiles(imageFilter);

    int totalImages = imageFiles.length;
   // println("total de imagens na pasta: "+ totalImages);
    return totalImages;
  }

  final FilenameFilter imageFilter = new FilenameFilter() {
    boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(".png");
    }
  };
}

