color palette [] = new color [256];

void setup() {
  size(250, 250, P2D);
  background(51);
  noStroke();
  //smooth();

  // create color palette
  int i, r, g, b;
  // between 0..100 fade black to red
  for (i = 0; i < 100; i++)
  {
    r = i * 255 / 100;
    g = 0;
    b = 0;
    palette[i] = color (r, g, b);
  }
  // between 100..150 fade red to yellow
  for ( ; i < 150; i++)
  {
    r = 255;
    g = (i-100) * 255 / 50;
    b = 0;
    palette[i] = color (r, g, b);
  }
  // between 150..255 fade yellow to blue 
  for ( ; i <= 255; i++)
  {
    r = 255 - ((i - 150) * 255 / 106);
    g = 255 - ((i - 150) * 255 / 106);
    b = (i - 150) * 255 / 106;
    palette[i] = color (r, g, b);
  }
}

float deg;
float rad;

color currentColor;

int currentPixel;
float fColor;

int time;

float value;


void draw() {

  loadPixels();  


  for(int y=0;y<height;y++) {

    //draw line
    for(int x=0;x<width;x++) {

      // 4 different sinus functions modulating
      fColor = ((sin (x/18.0 + time/99.0) + cos (y/39.0 + time/30.0))
               + sin (x/39.0 - time/40.0) + cos (y/15.0 - time/40.0)) 
               / 4;
      
      /* variante
      fColor = ((sin (x/15.0 + time/99.0) * cos (y/39.0 + time/30.0))
               + sin (x/39.0 - time/40.0) * cos (y/15.0 - time/40.0)) / 4;
      */  
      
      // normalize to 0..255.
      fColor = ((fColor + 1) / 2) * 255;

      // get color from palette
      currentColor = palette[int (fColor)];

      // colorize current pixel
      currentPixel = (y * width)  + x;
      pixels[currentPixel] = currentColor;      
    }

  }

  updatePixels();
  time++;

}







