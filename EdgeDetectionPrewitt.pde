PImage img;
PrintWriter output;
PImage gradiente;
PImage gradiente2;
PImage gx;
PImage gy;

void setup()
{
  background(200);
  size(1050,700);
  //IOIO.jpg
  img = loadImage("IOIOBN.jpg");
  image(img,0,0);
  filter(GRAY);
  gradiente =createImage(1050,700,RGB);
  gradiente2 =createImage(1050,700,RGB);
  gx =createImage(1050,700,RGB);
  gy =createImage(1050,700,RGB);
  output = createWriter("C:/Users/Gianfranco/Documents/Processing/Immagini/positions.txt");
}
int i=0;
void draw()
{
  if(i<img.height-2){
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
    
    int Gijx=(img.pixels[i7]+img.pixels[i8]+img.pixels[i9])-(img.pixels[i1]+(2*img.pixels[i2])+img.pixels[i3]); 
    int Gijy=(img.pixels[i3]+img.pixels[i6]+img.pixels[i9])-(img.pixels[i1]+(2*img.pixels[i4])+img.pixels[i7]);
    
    float magnitudine = pow(((Gijx*Gijx)+(Gijy*Gijy)),0.5);
    float magnitudine2 = Gijx+Gijy;
    
    output.print("x "+Gijx + ", ");
    output.print("y "+Gijy+ ", ");
    output.println("magnitudine "+magnitudine+ ", ");
    gradiente.pixels[i5]=color(magnitudine);
    gradiente2.pixels[i5]=color(magnitudine2);
    gx.pixels[i5]=color(Gijx);
    gy.pixels[i5]=color(Gijy);
    
  }
  i++;
  }
  else{
    output.close();
    image(gradiente,0,0,525,350);
    image(gradiente2,525,350,525,350);
    image(gx,525,0,525,350);
    image(gy,0,350,525,350);
    return;
  }
}
