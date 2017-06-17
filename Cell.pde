class Cell{
int x,y;
private int roundNum = 0;
private boolean alive = false;
boolean haveSet = false;
Cell(int x,int y){
  this.x = x;
  this.y = y;
}

void addOneRoundNum(){
  /*if((++roundNum)>=4||roundNum==1){alive = false;return;}
  if(roundNum==3){alive = true;return;}*/
  roundNum++;
}
void resetNum(){
  if(roundNum>=4||roundNum<=1){alive = false;}
  else if(roundNum==3){alive = true;}
  roundNum = 0;
}
void kill(){alive = false;}
void rebirth(){alive = true;}
}