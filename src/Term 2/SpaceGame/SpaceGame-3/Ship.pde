class Ship{
  int x = width/2, y = height/2, r, g;
  
  void display(){
    if(inv){
      fill(0,255,255);
    }else{
      if(hp > 50){
        r = round(510+hp*-5.1);
        g = 255;
      }else if(hp < 50){
        r = 255;
        g = round(hp*5.1);
      }else{
        r = 255;
        g = 255;
      }
      fill(r,g,0);
    }
    circle(x,y,50);
    textAlign(CENTER,CENTER);
    fill(0);
    if(unlim){
      text('∞', x, y);
    }else{
      text(ammo,x,y);
    }
    if(w && y != 25){
      if(a||d){
        y -= round(sqrt(sq(8)/2));
      }else{
        y -= 8;
      }
    }
    if(a && x != 25){
      if(w||s){
        x -= round(sqrt(sq(8)/2));
      }else{
        x -= 8;
      }
    }
    if(s && y+25 != height){
      if(a||d){
        y += round(sqrt(sq(8)/2));
      }else{
        y += 8;
      }
    }
    if(d && x+25 != width){
      if(w||s){
        x += round(sqrt(sq(8)/2));
      }else{
        x += 8;
      }
    }
    if(x<25){
      x = 25;
    }else if(x+25 > width){
      x = width-25;
    }else if(y<25){
      y = 25;
    }else if(y+25 > height){
      y = height-25;
    }
    if(rocks.size() > 0){
      for(int i = 0;i < rocks.size();i++){
        Rock rk = rocks.get(i);
        if(sqrt(sq(rk.x-x)+sq(rk.y-y))<rk.size/2+25){
          if(inv){
            destroy(i);
          }else{
            hit(rk.size/3);
            rocks.remove(i);
          }
        }
      }
    }
  }
}
