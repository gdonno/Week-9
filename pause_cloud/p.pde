class P{
  float X;
  float Y;
  
  P(float xpos, float ypos){
    X=xpos;
    Y=ypos;
  }
  float x(){
    return X;
  }
  float y(){
    return Y;
  }
}
class crystal{
  float maxSize;
  float maxL;
  
  float L;
  float size;
  float angle;
  
  float endPX;
  float endPY;
  
  int branchCount=0;
  
  crystal[] branches;
  
  P middleP;
  P endP;
  P one;
  P two;
  P three;
  
 
 crystal(P p1){
   


   branches= new crystal[maxbranch];
   
   
   endPX=p1.x()+cos(angle);
   endPY=p1.y()+sin(angle);
   
   if( endPX>width){
     endPX=width;
   }
   if( endPX<0){
     endPX=0;
   }
   if( endPY>height){
     endPY=height;
   }
   if( endPY<0){
     endPY=0;
   }
   
   one= new P(endPX,endPY);
   
   L= random(20,40);
   angle=random(2/3*PI,4/3*PI);
   
   endPX=p1.x()+cos(angle)*L;
   endPY=p1.y()+sin(angle)*L;
   
   if( endPX>width){
     endPX=width;
   }
   if( endPX<0){
     endPX=0;
     }
   if( endPY>height){
     endPY=height;
   }
   if( endPY<0){
     endPY=0;
   }
   
   two= new P(endPX,endPY);
   
   L= random(10,40);
   angle=random(4/3*PI,2*PI);
   
   endPX=p1.x()+cos(angle)*L;
   endPY=p1.y()+sin(angle)*L;
   
   if( endPX>width){
     endPX=width;
   }
   if( endPX<0){
     endPX=0;
   }
   if( endPY>height){
     endPY=height;
   }
   if( endPY<0){
     endPY=0;
   }
   
   three= new P(endPX,endPY);
   
   
   
   
 }
P endP(){
  return endP;
}

void branch(){
   if (branchCount<maxbranch){
  branchCount++;
    if(branchCount % 3==0){
    branches[branchCount-1]= new crystal(this.one);
    }
      if( branchCount % 3==1){
      branches[branchCount-1]= new crystal(this.two);
      }
        if( branchCount % 3==2){
        branches[branchCount-1]= new crystal(this.three);
          }

  }
}
 
void showcrystal(){
  
   noStroke(); 
   color c;
    if (ampt>0.020) {
    c = color(random(190,230), 0, 0, 17); //option 1
    if (ampt>0.02) delay(1); //only works for the black cloud rather than red cloud when 
    //sound is played
  } else {
    c = color(random(1, 15), 30); //black
    //delay (1);
  }
   
    //fill(random(255), random(255), random(255), 17); //option 2
   //fill(random(100, 255), 30); //option 3 // 1-15
   //fill(random(1, 15), 30); //option 3 // 1-15
    fill(c); //option 1
    beginShape();
        vertex(one.x(), one.y());
        vertex(two.x(), two.y());
        vertex(three.x(), three.y());

    endShape();
  }


  
void display(){

  this.showcrystal();
  
  for(int i=0; i<branchCount; i++){
    branches[i].display();
   }
   
   this.branch(); 
  }
}
