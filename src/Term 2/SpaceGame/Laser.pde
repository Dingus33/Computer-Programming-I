class Laser{
  int x,y,z;
  float w = 0;
  
  Laser(int x, int y, int z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void display(){
    if(wave){
      fill(255,128,0);
    }else{
      fill(255,0,0);
    }
    rect(x-2,y,4,10);
    if(rocks.size() > 0){
      for(int i = 0;i < rocks.size();i++){
        Rock rk = rocks.get(i);
        int dist = round(sqrt(sq(rk.x-x)+sq(rk.y-y)));
        if(dist < rk.size/2){
          destroy(i);
          if(!wave){
            y = -50;
          }
        }
      }
    }
    y -= 10;
    x += z;
    if(wave){
      x += 30*cos(w);
      w += PI/6;
    }
  }
}
