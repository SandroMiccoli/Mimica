
void clearScreen() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    pixels[i] = color(0);
  }
  updatePixels();
}

boolean deleteFile(String path){
    File video = new java.io.File(dataPath(path));
    video.setExecutable(true);
    return video.delete();
}
