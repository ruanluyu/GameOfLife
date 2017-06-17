class SystemDrawer{
  PImage img = null;
  void loadImg(PImage in){
    img = in;
  }
  final static int BLOCK = 0; 
  final static int BEEHIVE = 1; 
  final static int LOAF = 2; 
  final static int BOAT = 3; 
  final static int TUB = 4; 
  final static int BLINKER = 5; 
  final static int TOAD = 6;
  final static int BEACON = 7; 
  final static int PULSAR = 8; 
  final static int PENTA = 9; 
  final static int GLIDER = 10; 
  final static int LWSS = 11; 
  final static int GGG = 12; 
  
  void drawItem(int id,int x,int y){
    drawItem(id,x ,y,0,0,false,false);
  }
  void drawItem(int id,int x ,int y,int d,int i,boolean mirX,boolean mirY){//direc 0~3
  d = d%4;
  PImage out = null;
    switch(id){
    case BLOCK:out =drawBLOCK(i);
    break;
    case BEEHIVE:out =drawBEEHIVE(i);
    break;
    case LOAF:out =drawLOAF(i);
    break;
    case BOAT:out =drawBLOCK(i);
    break;
    case TUB:out =drawBLOCK(i);
    break;
    case BLINKER:out =drawBLINKER(i);
    break;
    case BEACON:out =drawBEACON(i);
    break;
    case PULSAR://drawPULSAR(i);
    break;
    case PENTA://drawPENTA(i);
    break;
    case GLIDER:out =drawGLIDER(i);
    break;
    case LWSS:out =drawLWSS(i);
    break;
    case GGG:out =drawGGG(i);
    break;
    }
    out = rotateImg(out,d);
    if(mirX)out = mirImg(out,true);
    else if(mirY)out = mirImg(out,false);
    img.set(x,y,out);
  }
  
  PImage drawBLOCK(int i){
    return drawGraph(4,4,"1,1;2,1;1,2;2,2");
  }
  
  PImage drawBEEHIVE(int i){
    return drawGraph(6,5,"2,1;3,1;4,2;3,3;2,3;1,2");
  }
  
  PImage drawLOAF(int i){
    return drawGraph(6,6,"2,1;3,1;4,2;4,3;3,4;2,3;1,2");
  }
  
  PImage drawBOAT(int i){
    return drawGraph(5,5,"1,1;2,1;3,2;2,3;1,2");
  }
  
  PImage drawTUB(int i){
    return drawGraph(5,5,"2,1;1,2;3,2;2,3");
  }
  
  PImage drawBLINKER(int i){
    i = i%2;
    switch(i){
      case 0:
      return drawGraph(5,5,"2,1;2,2;2,3");
      case 1:
      return drawGraph(5,5,"1,2;2,2;3,2");
    }
    return null;
  }
  
  PImage drawTOAD(int i){
    i = i%2;
    switch(i){
      case 0:
      return drawGraph(6,6,"2,2;3,2;4,2;1,3;2,3;3,3");
      case 1:
      return drawGraph(6,6,"1,2;1,3;2,4;3,1;4,2;4,3");
    }
    return null;
  }
  
  PImage drawBEACON(int i){
    i = i%2;
    switch(i){
      case 0:
      return drawGraph(6,6,"1,1;2,1;1,2;4,3;3,4;4,4");
      case 1:
      return drawGraph(6,6,"1,1;2,1;1,2;4,3;3,4;4,4;2,2;3,3");
    }
    return null;
  }
  
  PImage drawGLIDER(int i){
    i = i%4;
    switch(i){
      case 0:
      return drawGraph(5,5,"2,1;3,2;1,3;2,3;3,3");
      case 1:
      return drawGraph(5,5,"2,2;4,2;3,3;4,3;3,4");
      case 2:
      return drawGraph(5,5,"3,1;1,2;3,2;2,3;3,3");
      case 3:
      return drawGraph(5,5,"1,1;2,2;3,2;1,3;2,3");
    }
    return null;
  }
    PImage drawLWSS(int i){
    i = i%4;
    switch(i){
      case 0:
      return drawGraph(7,6,"1,1;4,1;5,2;5,3;1,3;2,4;3,4;4,4;5,4");
      case 1:
      return drawGraph(7,6,"3,1;4,1;1,2;2,2;4,2;5,2;1,3;2,3;3,3;4,3;2,4;3,4");
      case 2:
      return drawGraph(7,6,"2,1;3,1;4,1;5,1;1,2;5,2;5,3;1,4;4,4");
      case 3:
      return drawGraph(7,6,"2,1;3,1;1,2;2,2;3,2;4,2;1,3;2,3;4,3;5,3;3,4;4,4");
    }
    return null;
  }
  PImage drawGGG(int i){
    PImage out = createImage(38,11,RGB);
    out.set(0,4,drawBLOCK(0));
    out.set(34,2,drawBLOCK(0));
    out.set(10,2,drawGraph(10,9,"3,1;4,1;2,2;6,2;1,3;1,4;1,5;5,4;7,3;7,4;7,5;8,4;2,6;6,6;3,7;4,7"));
    out.set(20,0,drawGraph(7,9,"5,1;5,2;3,2;1,3;2,3;1,4;2,4;1,5;2,5;3,6;5,6;5,7"));
    return out;  
  }
  
  PImage drawGraph(int w,int h,String sc){
    PImage out = createImage(w,h,RGB);
    String[] p = sc.split(";");
    for(int i = 0;i<p.length;i++){
      String[] pxy = p[i].split(",");
      out.set(parseInt(pxy[0]),parseInt(pxy[1]),color(255));
    }
    
    return out;
  }
  
  PImage mirImg(PImage in,boolean xm){
    PImage out = createImage(in.width,in.height,RGB);
    if(xm){
      for(int y = 0;y<in.height;y++){
        for(int x = 0;x<in.width;x++){
          out.set(x,out.height-y-1,in.get(x,y));
        }
      }
    }else{
      for(int y = 0;y<in.height;y++){
        for(int x = 0;x<in.width;x++){
          out.set(out.width-x-1,y,in.get(x,y));
        }
      }
    }
    return out;
  }
  
  PImage rotateImg(PImage in,int d){
    PImage out = null;
    switch(d){
      case 0:
      return in;
      case 1:
      out = createImage(in.height,in.width,RGB);
      for(int y = 0;y<in.height;y++){
        for(int x = 0;x<in.width;x++){
          out.set(out.width-y-1,x,in.get(x,y));
        }
      }
      break;
      case 3:
      out = createImage(in.height,in.width,RGB);
      for(int y = 0;y<in.height;y++){
        for(int x = 0;x<in.width;x++){
          out.set(y,out.height-x-1,in.get(x,y));
        }
      }
      break;
      case 2:
      out = createImage(in.width,in.height,RGB);
      for(int y = 0;y<in.height;y++){
        for(int x = 0;x<in.width;x++){
          out.set(out.width-x-1,out.height-y-1,in.get(x,y));
        }
      }
      break;
    }
    return out;
  }
  
}