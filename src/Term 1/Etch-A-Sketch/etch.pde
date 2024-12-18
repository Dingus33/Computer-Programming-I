// Dallin Mattinson | Etch A Sketch | 18 Sept 2024
int x,y,r,g,b,siz;
float n;
PImage e1;

void setup(){
  size(800,658);
  //fullScreen();
  background(0);
  noStroke();
  x = width/2-1;
  y = height/2-1;
  e1 = loadImage("Etch.png");
  r = 255;
  siz = 2;
  g = 0;
  b = 0;
  n = 0;
}

void draw(){
  fill(r,g,b);
  image(e1,0,0);
  rect(x,y,siz,siz);
  //WASD movement
  if(keyPressed) {
    if (key == 'w'||key == 'W'){
      y -= 2;
      if(siz == 1){y++;}
    } else if(key == 'a'||key == 'A'){
      x -= 2;
      if(siz == 1){x++;}
    } else if(key == 's'||key == 'S'){
      y += 2;
      if(siz == 1){y--;}
    } else if(key == 'd'||key == 'D'){
      x += 2;
      if(siz == 1){x--;}
    }
  }
  //Border
  if(x<114){
    x += 2;
  }else if(x+siz>width-118){
    x -= 2;
  }else if(y<117){
    y += 2;
  }else if(y+siz>height-138){
    y -= 2;
  }
  //Rainbow
  if(n >= 0 && n < 255){
    g++;
  }else if(n >= 255 && n < 510){
    g = 255;
    r--;
  }else if(n >= 510 && n < 765){
    r = 0;
    b++;
  }else if(n >= 765 && n < 1020){
    b = 255;
    g--;
  }else if(n >= 1020 && n < 1275){
    g = 0;
    r++;
  }else if(n >= 1275 && n < 1530){
    r = 255;
    b--;
  }else if(n==1530){
    b = 0;
    n = 0;
  }
  n++;
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP && siz < 400){
      x--;
      y--;
      siz += 2;
    }else if(keyCode == DOWN && siz > 2){
      x++;
      y++;
      siz -= 2;
    }
  }
  if(key != CODED){
    if(keyCode == TAB){
      saveFrame("EAS####.png");
    }else if(keyCode == BACKSPACE){
      background(0);
    }
  }
}
