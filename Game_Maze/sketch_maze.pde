import processing.sound.*;
SoundFile file;

Point point;

Tile[] tiles =  new Tile[0];

 int start;
int counter=0;



int[][] mymap = {
//  0  1  2  3  4  5  6  7  8  9 10  11 12 13 14 15 16 17 18 19 20
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1 },
  { 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },//
  { 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1 },
  { 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1 },
  { 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1 },//0
  { 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1 },
  { 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1 },
  { 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 },
  { 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0 },//
  { 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1 },
  { 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1 },
  { 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1 },
  { 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1 },
  { 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1 },
  { 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1 },
  { 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1 },
  { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1 },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
};
// Tile size
int tileW = 32;
int tileH = 32;





void Sound(){
  
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "Win(Super Mario).mp3");
  file.play();
  
}

void CreateMap(){
 
  //нулиране на масив
   tiles = (Tile[]) expand(tiles, 0);
  
// Create grid
  for (int i = 0; i <= 20; i++)//14 vmesto   9      20
  {
    for (int j = 0; j <= 20; j++)
    {
      Tile a = new Tile(j*tileW, i*tileH, tileW, tileH, mymap[i][j]);
      tiles = (Tile[]) append(tiles, a);
     // tiles[j]=new Tile(j*tileW, i*tileH, tileW, tileH, mymap[i][j]);
    
    } 
  }
 }



void setup()
{
  size(1000, 1000);//размер на прозореца
  smooth();
 
  //timer
  start = second();
  CreateMap();

/*
ArrayList<IntList> izhodi = new ArrayList<IntList>();
izhodi.add( new mymap[11][20]=0 );
*/
 
  // Create car object
  //car = new Car(10, 10, 10, 10, color(255, 255, 255), 10);
  //car = new Car(60,60, 60, 60, color(255, 255, 255), 64);
   point = new Point(320, 288, 32, 32, color(255, 255, 255), 32);//X320  Y    KOORDINATI; размери на фигура; стъпка
}

int choose;
int flag=0;
void draw()
{
  //timer
      background(0,21,4,44);//
      textSize(26);//Увеличаваме големината на текста
      int timer = second()-start;//second() връща моментната секунда от компютъра
      text("Таймер 5сек.: "+timer, 700, 100);
      
      text("Брой победи: "+counter+" от 3.",700,300,5);//опечатва броя на победите непрекъснато, което прави текста постоянен в прозореца
      
   //задаване на начални стойности
      if(flag==0){
       mymap[7][0]=1;
       mymap[11][20]=1;
       mymap[4][20]=0;
       CreateMap();
       flag=1;
     }
     
 if(timer==5){
       choose=0;//нулиране
       choose=int(random(2));//при 2 => 0&1
       print("random: "+choose+"/"+~choose);
       //mymap[7][0]=1;
       //mymap[11][20]=1;
       //mymap[4][20]=0;
       //CreateMap();
      
       
       if( mymap[4][20]==0) {
      
       mymap[4][20]=1;
        mymap[7][0]=choose;//choose
      if(choose==0) mymap[11][20]=choose+1; else mymap[11][20]=choose-1;//~choose
      
      // start = second();
     }
     else if( mymap[7][0]==0) {
      
       mymap[4][20]=choose;//
       mymap[7][0]=1;
      if(choose==0) mymap[11][20]=choose+1; else mymap[11][20]=choose-1;//~choose//
      
      // start = second();
     }
     else if( mymap[11][20]==0) {
      
       if(choose==0) mymap[4][20]=choose+1; else mymap[4][20]=choose-1;//~choose//
       mymap[7][0]=choose;//
       mymap[11][20]=1;
      
      //start = second();
     }
     CreateMap();
       
       print(" time: "+timer+";");
       start = second();
       
      }
      
  else if(timer<0||timer>5) //Поправя се грешката от прескачането
  {
   start = second();//нулиране
   //timer=0; 
  }
  


  // Create grid
  for(int i = 0; i < tiles.length; i++)
  {
    tiles[i].display();
  }

  // Display car
  point.display(); 

}

void keyPressed()
{

  if(keyCode == UP)    { 
    point.move("up"); 
  }
  if(keyCode == DOWN)  { 
    point.move("down"); 
  }
  if(keyCode == LEFT)  { 
    point.move("left"); 
  } 
  if(keyCode == RIGHT) { 
    point.move("right"); 
  }
}




class Point
{
  float x, y, w, h;
  color c;
  float s;

  Point(float tempX, float tempY, float tempW, float tempH, color tempColor, float tempSpeed)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempColor;
    s = tempSpeed;
  }



  void display()
  {
    fill(c);
    noStroke();
    ellipseMode(CORNER);
    ellipse(x, y, w, h); 
  }

  void move(String direction)
  {
    if(keyPressed) 
    {
      // Directions
      if(direction == "up")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((point.x == tiles[i].x) && (point.y == tiles[i].y))
          {
            if(tiles[i-21].v == 0.0)//10      21
            {
              point.y = point.y - s;
              break;
            }
          }
        }
      }
      if(direction == "down")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((point.x == tiles[i].x) && (point.y == tiles[i].y))
          {
            if(tiles[i + 21].v == 0.0)//10    21
            {
              point.y = point.y + s;
              break;
            }
          }
        }
      }
      if(direction == "left")
      {

        for(int i = 0; i < tiles.length; i++)
        {
          if((point.x == tiles[i].x) && (point.y == tiles[i].y))
          {
            if(tiles[i-1].v == 0.0)
            {
              point.x = point.x - s;
              //new
              if((point.x==0&&point.y==224)||(point.x==640&&point.y==96)||(point.x==640&&point.y==320))
             { 
               counter++;
              // text(counter,800,300,5);
               if(counter==3){
               Sound(); //за 2-то и 3-тото усл. са излишни, тъй като ф-я е за наляво -  left
              text("YOU WINNN",800,200,5);
              delay(6*1000);
              exit();
               }//if counter
            }
              break;
            }
          }
        }
      }
      if(direction == "right")
      {
        for(int i = 0; i < tiles.length; i++)
        {
          if((point.x == tiles[i].x) && (point.y == tiles[i].y))
          {
            if(tiles[i+1].v == 0.0)
            {
              point.x = point.x + s;
              
              //new
              if((point.x==0&&point.y==224)||(point.x==640&&point.y==128)||(point.x==640&&point.y==352))
              { 
              counter++;
              //text(counter,800,300,5);
              if(counter==3){
                Sound(); 
                text("YOU WINNN",800,200);
                delay(6*1000);
                exit();
                }//if counter
              }
              break;
            }
          }
        }
      }
    }
  }
}


class Tile
{
  float x, y, w, h, v;

  Tile(float tempX, float tempY, float tempW, float tempH, int tempValue)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    v = tempValue;// 0-та или 1-та от масива
  }
  
//Методът е на класа
  void display()
  {
    noStroke();
    if(v == 0)
    {
      fill(100);
    }
    if(v == 1)
    {
      fill(0, 255, 0); 
    }
    rectMode(CORNER);
    rect(x, y, w, h); 
  }
}
