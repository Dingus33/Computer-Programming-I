class Power{
  int x, y, chance;
  char abil;
  boolean hit = false;
  
  Power(int x, int y, int chance){
    this.x = x;
    this.y = y;
    this.chance = chance;
  }
  
  void display(){
    switch(chance){
      case 1:
      case 2:
      case 3:
      case 4:
        fill(255,255,0);
        abil = 'a';
        break;
      case 5:
        fill(0,255,0);
        abil = 'h';
        break;
      case 6:
        fill(0,0,255);
        abil = 'u';
        break;
      case 7:
        fill(255,0,0);
        abil = 'm';
        break;
      case 8:
        fill(0,255,255);
        abil = 'i';
        break;
      case 9:
        fill(255);
        abil = 'k';
        break;
      case 10:
        fill(255,128,0);
        abil = 'w';
        break;
    }
    circle(x,y,20);
    if(sqrt(sq(s1.x-x)+sq(s1.y-y))<35){
      powerUp(abil);
      hit = true;
    }
    y += 5;
  }
}
