void clearScreen() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    pixels[i] = color(0);
  }
  updatePixels();
}

void sortUniqueValues(int maximumValue, int [] copyOfTheValues) {

  int [] checkedValues = new int [maximumValue];// marca qual numero ja foi sorteado
  int raffledValue; //valor sorteado 
  int totalDrawnValues = 0; //contador de slots preenchidos  

  do {
    //sorteia um número
    raffledValue = int(random (0, maximumValue));
    // println("imagem sorteada: " +qualImg);
    //se o numero ainda nao foi sorteado parte para sortear o do proximo slot
    if (checkedValues[raffledValue]==0) {
      checkedValues[raffledValue] = 1;

      totalDrawnValues++;

      //copia o valor sorteado em uma variavel auxiliar 
      copyOfTheValues[maximumValue-1] = raffledValue;
    }
  } 
  while (totalDrawnValues<4);
}

