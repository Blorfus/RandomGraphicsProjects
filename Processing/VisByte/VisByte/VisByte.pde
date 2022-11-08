class visByte{
  byte val;
  float x, y; //used to control render position
  float hsize, vsize;
  float cornerRadius=5.0;
  color foreground = color(0, 165, 0); 
  color background = color(0, 0, 0);
  float hSpacing; // The distance between centers of each circle
  float padding=6; // A buffer between the circle and the line, equal on top and bottom
  float vcenter; //the vertical center of the drawing
  float bitRadius; //the size to draw the circles
  int lineWeight=2;
  String binaryNotation;
  float innerRadius=10; //The radius to draw an inner circle at.
  
  visByte(char c, float startX, float startY, float h, float w){
    setCharValue(c);
    x = startX;
    y = startY;
    setDrawSize(h, w);
    }
  
  void setCharValue(char c){
      setValue(byte(c));
      }
  void setValue(byte b){
      val = b;
      binaryNotation=binary(b);
      }
   void setDrawSize(float drawHeight, float drawWidth){
     vsize = drawHeight;
     hsize = drawWidth;
     //caluclate proportions
     vcenter = (drawHeight-padding)/2;
     hSpacing = (drawWidth-(9*padding))/9;
     bitRadius = hSpacing;
     //store values
     }
    
  void render(){
    stroke(foreground);
    strokeWeight(lineWeight);
    fill(background);
    rect(x+4, y+4, hsize-8, vsize-8, cornerRadius);
    float drawLoc_x=x;
    float drawLoc_y=vcenter+y;
    for(int i=0; i<8; i++){ ///render each bit as a circle.
      char c = binaryNotation.charAt(i);
      drawLoc_x=drawLoc_x+padding+bitRadius;
      stroke(foreground);
      circle(drawLoc_x, drawLoc_y, bitRadius);
      //if the value is true for this bit...
      if(c == '1'){
            fill(foreground);
            circle(drawLoc_x, drawLoc_y, bitRadius-innerRadius);
            fill(background);
            }
      //drawLoc_x=drawLoc_x+hSpacing;
      }
    
    }//endRender
  }

int visBytes = 16;
visByte vs[]=new visByte[visBytes];
String s = "GJHWIOEHOIHEOFIHNEOHFOIWHEOIRFHOWENRFOWHEOFNWOENFOOeowhnfgowiehgfowjalogaohganOIAJHOIGHOEhGWOIENGOIWNEGOINEORFhoeHJFOEHWOIFOWENFOIEWHGONEWOGINWEOGNOWEG";
int slen=s.length();
int bookmark=0;
  int v = 60; //height to draw each at
  int w = 280; //width to draw each at
  int winheight=v*(visBytes/2);
  int winwidth= w*2;

void settings(){
  size(winwidth,winheight);
  }

void setup(){
  
  int sx=0;
  int sy=0;
  for(int kj=0; kj<visBytes; kj=kj+2){
    vs[kj]=new visByte(s.charAt(kj), sx, sy, v, w);
    vs[kj+1]=new visByte(s.charAt(kj+1), sx+w, sy, v, w);
    sy=sy+v;
    bookmark++;
    }
  background(0);
}

void draw(){
  delay(75);
  for(int ctr=0; ctr<vs.length; ctr++){
    vs[ctr].setCharValue(s.charAt(bookmark%slen));
    vs[ctr].render();
    bookmark++;
    }
}
