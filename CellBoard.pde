class CellBoard{
int w;
int h;

ArrayList<Cell> cells = null;
ArrayList<Cell> activated = null;
CellBoard(int w,int h){
  this.w = w;
  this.h = h;
  cells = new ArrayList<Cell>(w*h);
  activated = new ArrayList<Cell>(w*h);
  buildBoard();
}


void buildBoard(){
  for(int y = 0;y<h;y++){
    for(int x = 0;x<w;x++){
      cells.add(new Cell(x,y));
    }
  }
}

void loadAliveCells(PImage input,CBIf func){
  Cell cur = null;
  for(int y = 0;y<h;y++){
    for(int x = 0;x<w;x++){
      if(!func.isAlive(input,x,y))continue;
      cur = getCell(x,y);
      cur.alive = true;
      cur.haveSet = true;
      activated.add(cur);
    }
  }
}

void calculateOneStep(){
  synchronized(activated){
    for(int i = activated.size()-1;i>=0;i--){calculate(activated.get(i));}
    clearActivatedCells();
  }
}

void calculate(Cell target){
  Cell cur = null;
  int x = target.x;
  int y = target.y;
  for(int i = 0;i<8;i++){
    cur = getCell(x+getRoundX(i),y+getRoundY(i));
    if(cur == null)continue;
    if(!cur.haveSet){activated.add(cur);cur.haveSet = true;}
    cur.addOneRoundNum();
  }
}

void clearActivatedCells(){
  Cell cur = null;
  for(int i = activated.size()-1;i>=0;i--){
    cur = activated.get(i);
    cur.resetNum();
    if(!cur.alive){cur.haveSet = false;activated.remove(i);};
  }
}

int getRoundX(int id){//0~7
  if(id>=5)return -1;
  if(id==4||id==0)return 0;
  return 1;
}

int getRoundY(int id){//0~7
  if(id>=3&&id<=5)return 1;
  if(id==2||id==6)return 0;
  return -1;
}

Cell getCell(int x, int y){
  return isInside(x,y)?cells.get(x+y*w):null;
}

boolean isInside(int x, int y){
  return (x>=0&&y>=0&&x<w&&y<h)?true:false;
}

void render(){
  synchronized(activated){
  println(1);
  fill(255);
  for(Cell cur:activated){
    set(cur.x,cur.y,color(255));
  }
  println(2);
  }
}

void render(PGraphics in){
  for(Cell cur:activated){
    in.set(cur.x,cur.y,color(255));
  }
}
}