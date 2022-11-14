
int winheight=1200;
int winwidth= 1600;
int ctrx = winwidth/2;
int ctry = winheight/2;
int ptcount=20;
color colors[]= { 0xCCFF0000, 0xCC00CC00, 0xCC0000FF, 0xCCFF00FF, 0xCCFFFF00, 0xCC00FFFF, 0xFF000000, 0xFFFFFFFF};
pt points[]= new pt[ptcount];
color bgColor=0xFF000044;

void settings(){
  size(winwidth,winheight);
  }
void setup(){
  

  background(bgColor);
  /*for(int i=0; i<ptcount; i++){
    points[i]=new pt( (i*50)+100, i*50, i);
    if(i%2==0){
        points[i].translate_pt(-100, 0, 0);
      }
    }*/
    points = rayleighPhaseFunction(ptcount, float(ctrx), float(ctry));
  }
  
float noiseScale = 0.03;  
  
void draw(){
  float noiseVal = noise((mouseX)*noiseScale, mouseY*noiseScale);
  background(bgColor);  //blank out the background
  for(int i=0; i<ptcount; i++){
      noiseVal = noise((mouseX+i)*noiseScale, (mouseY-i)*noiseScale);
     int dx = int(10*noiseVal);
     int dy = int(10*noiseVal);
     if(noiseVal<=0.5) { dx=0-dx; dy=0-dy; }
     points[i].translate_pt(dx, dy, 0);
     drawPoint(points[i], "p"+i);
     println("noise:"+noiseVal+ "dx:"+dx+" dy:"+dy);
    }
  beginShape(TRIANGLE_FAN);
  for(int i=0; i<ptcount; i++){
     vertex(points[i].x, points[i].y);
    }
  endShape(CLOSE);
}

pt[] rayleighPhaseFunction(int ptCt, float x, float y){
  pt points[] = new pt[ptCt];
  float thetaDiv = 360/ptCt;
  float tempx=0.0;
  float tempy=0.0;
  float angle=0;
  for(int i=0; i<ptCt; i++){
    tempy=4000*(3*(1+(sq(cos(radians(angle))))))/(16*PI);
    tempx=4000*(3*(1+(sq(sin(radians(angle))))))/(16*PI);
    println("["+i+"] x:"+tempx+" y:"+tempy+ " t="+ angle);
    if(angle <=90){ 
        //first quadrant x+ y+
        }
    else if((angle >90)&&(angle <=180))  {
        //second quadrant x+ y-
        tempy=0-tempy;
        }
    else if((angle >180)&&(angle <=270)){
        //third quadrant x- y-
        tempy=0-tempy;
        tempx=0-tempx;
        }
    else {
        //fourth quadrant x- y+
        tempx=0-tempx;
        }
    points[i] = new pt(x+tempx, y+tempy, 0.0);
    angle=angle+thetaDiv;
    }
  return points;
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
  float x;
  float y;
  float z;
  
  pt(){
    x=0;
    y=0;
    z=0;
    }
  pt(int dx, int dy, int dz){
    x=float(dx);
    y=float(dy);
    z=float(dz);
  }
  pt(float dx, float dy, float dz){
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
    x=x*sclx;
    y=x*scly;
    z=z*sclz;
    }
  
  
}
