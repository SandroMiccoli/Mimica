void clearScreen() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    pixels[i] = color(0);
  }
  updatePixels();
}

