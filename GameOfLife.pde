PImage img;
PGraphics pg;
PImage out;
PImage lines;
SystemDrawer sd;
CBIf cbfunc = new CBIf(){
  boolean isAlive(PImage input,int x, int y){
    return brightness(input.get(x,y))>125;
  }
};
CellBoard cb;
void setup(){
  //frameRate(10);
  size(1000 ,1000);
  img = createImage(100,100,RGB);
  sd = new SystemDrawer();
  sd.loadImg(img);
  sd.drawItem(SystemDrawer.LWSS,12,12,0,0,false,false);
  pg = createGraphics(img.width,img.height);
  out = createImage(width,height,RGB);
  lines = createImage(img.width,img.height,RGB);
  
  int c;
  for(int x = 0;x<lines.width;x++){
    for(int y = 0;y<lines.height;y++){
      c = (x+y)%2==1?100:0;
      lines.set(x,y,color(0,c,c));
    }
  }
  /*
  for(int x = 0;x<img.width;x++){
    for(int y = 0;y<img.height;y++){
      img.set(x,y,color(random(0,255)));
    }
  }*/
  /*img.set(0,0,color(255));
  img.set(0,2,color(255));
  img.set(1,1,color(255));
  img.set(1,2,color(255));
  img.set(2,1,color(255));*/
  cb = new CellBoard(img.width,img.height);
  cb.loadAliveCells(img,cbfunc);
}

void draw(){
  background(0);
  cb.calculateOneStep();
  pg.beginDraw();
  pg.clear();
  pg.image(lines,0,0);
  cb.render(pg);
  resizePG(pg,out);
  pg.endDraw();
  image(out,0,0);
}

void keyPressed(){
  cb.calculateOneStep();
  redraw();
}

void resizePG(PGraphics input,PImage output){
  int w = input.width;
  int h = input.height;
  int nw = output.width;
  int nh = output.height;
  for(int x = 0;x<nw;x++){
    for(int y = 0;y<nh;y++){
      output.set(x,y,input.get(floor(map(x,0,nw-1,0,w-1)),floor(map(y,0,nh-1,0,h-1))));
    }
  }
}