class Star{
  int x,y,speed,size;
  
  Star(int x, int y, int speed, int size){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.size = size;
  }
  
  void display(){
    fill(255);
    circle(x,y,size);
    y += speed;
  }
}
