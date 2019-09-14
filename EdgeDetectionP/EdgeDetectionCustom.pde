PImage img;
PImage Mask;
PImage Edged;
int template[][];
int i;

void setup()
{
  background(200);
  size(1050,700);
  //IOIO.jpg
  img = loadImage("IOIOBN.jpg");
  image(img,0,350,img.width/2,img.height/2);
  
  Mask =createImage(img.width,img.height,RGB);
  Edged =createImage(img.width,img.height,RGB);
  i=0;
  int dim=3;
  //inizializzazione del template
  template = new int [dim][dim];
  for (int riga=0;riga<dim;riga++){
    for(int colonna=0 ; colonna <dim;colonna++)
    {
      if (colonna%2!=0)//le colonne dispari avranno 1 , quindi quella centrale
      template[riga][colonna]=1;
      else{
        template[riga][colonna]=0;
      }
    }
  }
  /////
 img=padding(img) ;
 image(img,0,0,img.width/2,img.height/2);
  
  
}


/*
* i5 sarà il pixel di riferimento, quindi dobbiamo applicare un padding, lo si fà nella funzione padding
*/
void draw()
{
  int index []= new int[9];
  if(i<img.height){
  for(int j=0;j<img.width;j++)
  {
    index[0] = i*img.width + j ;
    index[1] = i*img.width + j + 1 ;
    index[2] = i*img.width + j + 2 ;
    index[3] = (i+1)*img.width + j ;
    index[4] = (i+1)*img.width + j + 1 ;
    index[5] = (i+1)*img.width + j + 2 ;
    index[6] = (i+2)*img.width + j ;
    index[7] = (i+2)*img.width + j + 1 ;
    index[8] = (i+2)*img.width + j + 2 ; 
    
    int value=0;
    for(int it=0;it<3;it++)
      for(int jt=0; jt<3; jt++)
      {
        value+= template[it][jt]*img.pixels[index[it+jt]];
        print(value);
      }
    println("fine calcolo");
    value=value/9;

    
  }
  i++;
  }
  else{
  }
  
    image(Edged,525,350,525,350);
    return;
}




//funzione che mi circonda l'immagine con un bordo nero
PImage padding(PImage img)
{
  width=img.width;
  height = img.height;
  PImage padded =createImage(width+2,height+2,RGB);

  //ricopiatura
    for(int i =1;i<height-1;i++){
    for(int j=1; j<width-1;j++)
    {
      int i1 = i*img.width + j ;//indicd che si muoverà in padding
      int i2 = (i+1)*img.width + (j+1) ;//indicd che si muoverà in img      
      padded.pixels[i1]= img.pixels[i2];   
    }
  }
  //in teoria ora ho un bordo nero intorno l'immagine
  image(img,525,0,525,350);
  return padded;
  
}
