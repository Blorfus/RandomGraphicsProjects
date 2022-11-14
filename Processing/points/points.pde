
int winheight=1200;
int winwidth= 1600;
int ptcount=20;
color colors[]= { 0xCCFF0000, 0xCC00FF00, 0xCC0000FF, 0xCCFF00FF, 0xCCFFFF00, 0xCC00FFFF, 0xFF000000, 0xFFFFFFFF};
pt points[]= new pt[ptcount];

void settings(){
  size(winwidth,winheight);
  }
void setup(){
  

  background(color(0xFF000077));
  for(int i=0; i<ptcount; i++){
    points[i]=new pt( (i*50)+100, i*50, i);
    if(i%2==0){
        points[i].translate_pt(-100, 0, 0);
      }
    }
  }
  
void draw(){
  for(int i=0; i<ptcount; i++){
     drawPoint(points[i], "p"+i);
    }
}

void drawPoint(pt p, String pName){
  fill(colors[1]);
  int pOffset=20;
  float pointDrawSize=4.0;  
  circle(p.x, p.y, pointDrawSize);
  textSize(22);
  text(pName, p.x+pOffset, p.y+pOffset);
  }


class pt{
  int x;
  int y;
  int z;
  
  pt(){
    x=0;
    y=0;
    z=0;
    }
  pt(int dx, int dy, int dz){
    x=dx;
    y=dy;
    z=dz;
  }
  void translate_pt(int addx, int addy, int addz){
    //moves the point by a specified amount, can be negative.
    x=x+addx;
    y=y+addy;
    z=z+addz;
    }
  void scalept(float sclx, float scly, float sclz){
    //moves the point a fractional amount
    x=int(float(x)*sclx);
    y=int(float(x)*scly);
    x=int(float(x)*sclx);
    }
  
  
}
