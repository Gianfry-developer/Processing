PImage img;
PrintWriter output;
PImage gradiente;
PImage gradiente2;
PImage gx;
PImage gy;
int o= 0;
int n = 50;
int m = 100;

int larg=155;
int lung=161;

void setup()
{
  background(200);
  size(1050,700);
  //IOIOBN.jpg
  img = loadImage("IOIO.jpg");
  image(img,0,0);
  gradiente =createImage(larg,lung,RGB);
  gradiente2 =createImage(larg,lung,RGB);
  gx =createImage(larg,lung,RGB);
  gy =createImage(larg,lung,RGB);
  output = createWriter("C:/Users/Gianfranco/Documents/Processing/Immagini/positions.txt");
}

void draw()
{
  loadPixels();
  
  for(int i=0;i<img.height-2;i++){
  for(int j=0;j<img.width-2;j++)
  {
    int i1 = i*img.width + j ;
    int i2 = i*img.width + j + 1 ;
    int i3 = i*img.width + j + 2 ;
    int i4 = (i+1)*img.width + j ;
    int i5 = (i+1)*img.width + j + 1 ;
    int i6 = (i+1)*img.width + j + 2 ;
    int i7 = (i+2)*img.width + j ;
    int i8 = (i+2)*img.width + j + 1 ;
    int i9 = (i+2)*img.width + j + 2 ; 
    
    
    int Gijx=((m*img.pixels[i7])+(n*img.pixels[i8])+(o*img.pixels[i9]))-((m*img.pixels[i1])+(n*img.pixels[i2])+(o*img.pixels[i3])); 
    int Gijy=((m*img.pixels[i3])+(n*img.pixels[i6])+(o*img.pixels[i9]))-((m*img.pixels[i1])+(n*img.pixels[i4])+(o*img.pixels[i7]));
    
    float magnitudine = pow(((Gijx*Gijx)+(Gijy*Gijy)),0.5);
    float magnitudine2 = (Gijx+Gijy);
    
    //output.print("x "+Gijx + ", ");
    //output.print("y "+Gijy+ ", ");
    //output.println("magnitudine "+magnitudine+ ", ");
    gradiente.pixels[i5]=color(magnitudine);
    gradiente2.pixels[i5]=color(magnitudine2);
    gx.pixels[i5]=color(Gijx);
    gy.pixels[i5]=color(Gijy);
    }
  }
  updatePixels();
    //output.close();
    image(gradiente,525,350-img.width);
    image(gradiente2,525,350);
    image(gx,525,0);
    image(gy,0,350);
    //return;
}
