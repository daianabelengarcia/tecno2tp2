int indexImagenes = 0;
int indexTirar = 0;
int posX = 50;
int fondoX = 0;

float rexarañaX = 0;  // La posición x del personaje

PImage [] images = new PImage[7];
PImage [] tirar = new PImage[3];
PImage fondo;

boolean detenerAnimacion = false; // Variable para controlar la animación

void setup () {
  size (1000, 600);
  fondo = loadImage("fondo2.png");
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(i+".png");
  }
  for (int i = 0; i < tirar.length; i++) {
    tirar[i] = loadImage("tira"+i+".png");
  }
}

void draw () {
   // Calcula la diferencia entre la posición del personaje y la posición de la cámara
  float xOffset = posX - rexarañaX;
  
  // Ajusta las coordenadas de dibujo según la posición de la cámara
  translate(xOffset, 0);
  
  image(fondo,fondoX,0,2998,600);
  
  if (!detenerAnimacion) {
    image(images[indexImagenes], posX, height-289, 178, 289);
    if (frameCount % 4 == 0) {
      indexImagenes = (indexImagenes + 1) % images.length;
      rexarañaX ++;
      fondoX --;
    }
  }
    telaraña();
  // Actualiza la posición de la cámara para seguir al personaje
  rexarañaX = posX;
}

void telaraña() {
  if (keyPressed) {
    if (key =='a'|| key == 'A') {
      image(tirar[indexTirar],posX,height-289,178,289);
      if (frameCount %4 ==0) {
      indexTirar = (indexTirar+1)%tirar.length;
      rexarañaX ++;
      fondoX --;
      }
      detenerAnimacion = true; // Detener la animación al tocar la tecla 'a' o 'A'
    }
  } else {
    detenerAnimacion = false; // Si la tecla no está presionada, reanudar la animación.
  }
}
