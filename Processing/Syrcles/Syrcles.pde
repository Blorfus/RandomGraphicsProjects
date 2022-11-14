class syrcles{
  float x, y; //used to control render position
  float radius;
  
  
  syrcles(float ctr_x, float ctr_y, float rad){  //constructor
      x=ctr_x;
      y=ctr_y;
      radius = rad;
    }
  void render(){ //Draw the shape to the screen
    float curr=radius;
    color currColor=colors[2];
    for(int i=0; i<100; i++){
      stroke(currColor);
      fill(currColor>>1);
      circle(x, y, curr);
      currColor = currColor>>2; //change color
      curr = curr*0.9;
      }
    }
  void setSize(float newRadius){
    radius=newRadius;
    }
  void setLocation(float ctr_x, float ctr_y){
    x=ctr_x;
    y=ctr_y;
    }
   float getX(){
     return x;
     }
   float getY(){
     return y;
     }
  
}

int winheight=1200;
int winwidth= 1600;
int circleCount=20;
color colors[]= { 0xCCFF0000,0xCCFF0AB0, 0xCC0AFF0B, 0xCC0CF0FF, 0xCCFF00FF, 0xCCFFFF00, 0xCC00FFFF, 0xFF000000, 0xFFFFFFFF};
syrcles circles[]= new syrcles[circleCount];

void settings(){
  //size(winwidth,winheight,OPENGL);
  fullScreen(processing.opengl.PGraphics3D, 1);
  }

void setup(){
  int sx=0;
  int sy=0;
  int offset=50;

  background(0);
  for(int z=0; z<circleCount; z++){
    circles[z]=new syrcles( sx+(offset*z), sy+(offset*z), 200.0);
    }
  
}
int currx=800, curry=600;
int baseRadius = 300;
int angularRotationFactor=1;
int radialOffset=0;
int radius=750;
int loopCtr=24;
void draw(){
    /*for(int i=0; i<circles.length; i++){
      float newx=circles[i].getX()+20;
      float newy=circles[i].getY()+20;
      circles[i].render();
      circles[i].setLocation(newx, newy);
      }*/
      background(0);
    fractal(currx, curry, radius,radialOffset);
    loopCtr++;
     //radius=baseRadius+((loopCtr%12)*20);
     radialOffset=radialOffset+(((loopCtr%12)*angularRotationFactor)%360);
      

    //println("loopCtr:"+loopCtr+"newRaidus="+radius+" offsetAngle:"+radialOffset);
    //delay(10);
}

void fractal(int x, int y, int rad, int angularOffsetDeg){
   
    /*for(int i =0; i<60; i++){    
      fraclevel(i+(i*10),i+(i*10), 200.0, 4);
      }*/
      fraclevel(x, y, rad, 4, angularOffsetDeg);  
    }
  
void fraclevel(float ctrx, float ctry, float rad, int level, int angularOffsetDeg){
    if(level==0){
      return;
      }
     int aoff=0;
    //figure out x an y for a particular angle.
    if(level==4){
        if(angularOffsetDeg >360){ aoff=angularOffsetDeg%360;  }
        else {  aoff=angularOffsetDeg; }
        }
    for(int angle=angularOffsetDeg; angle<(angularOffsetDeg+360); angle=angle+90){
        float nextx = (sin(radians(angle))*(rad/2))+ctrx;
        float nexty = (cos(radians(angle))*(rad/2))+ctry;
        float nextrad = rad*0.5;
        
        staticCircle(ctrx, ctry, rad, colors[level], level);
        fraclevel(nextx, nexty, nextrad, level-1, angularOffsetDeg);
        }
  }

  void staticCircle(float x, float y, float radius, color startColor, int level){ //Draw the shape to the screen
    float curr=radius;
    color currColor=startColor;
    for(int i=0; i<10; i++){
      stroke(currColor);
      fill(currColor>>1);
      circle(x, y, curr);
      currColor = currColor>>2; //change color
      curr = curr*0.9;
      }
    /*fill(colors[level]);
    textSize(22);
    text("L"+level, x, y);*/
    }
