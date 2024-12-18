class Rock{
  int x,y,speed,size;
  
  Rock(int x, int y, int speed, int size){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.size = size;
  }
  
  void display(){
    fill(128);
    circle(x,y,size);
    y += speed;
  }
}
