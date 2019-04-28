P s;
P end;
crystal[] N;

int crystalNum=12;
int maxbranch=3;
int remainder;

PGraphics pg;

import processing.sound.*;
Amplitude amp;
AudioIn in;
float ampt;

void setup() {
  size(512, 424);
  frameRate(60);

  pg = createGraphics(500, 500);
  N= new crystal[crystalNum];
  s= new P(mouseX, mouseY);

  for (int i=0; i<crystalNum; i++) {
    N[i]= new crystal(s);
  }
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  background(255);
  s= new P(mouseX, mouseY);
  remainder=frameCount % crystalNum;
  N[crystalNum-remainder-1]= new crystal(s);

  pg.beginDraw(); 
  pg.endDraw();
  image(pg, 0, 0);
  for (int i=0; i<crystalNum; i++) {
    N[i].display();
    N[i].branch();
  }
  ampt = amp.analyze();
  println(ampt);


    
    
  }
