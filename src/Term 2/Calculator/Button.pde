class Button{
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on, isNum, isOp;
  
  // Constructor
  Button(int x, int y, int w, int h, char val, int col, boolean isNum, boolean isOp){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.isNum = isNum;
    this.isOp = isOp;
    if(col == 0){
      c1 = color(255);
      c2 = color(170);
    }else if(col == 1){
      c1 = color(150);
      c2 = color(100);
    }else if(col == 2){
      c1 = color(0, 140, 255);
      c2 = color(0, 95, 170);
    }else if(col == 3){
      c1 = color(255, 128, 0);
      c2 = color(170, 85, 0);
    }
    
  }
  
  // Member Methods
  void display(){
    if(mouseX>(x-w/2) && mouseX<(x+w/2) && mouseY>(y-h/2) && mouseY<(y+h/2)){
      on = true;
      fill(c2);
    }else if(op == val||(op == '/' && val == '÷')){
      fill(c2);
    }else{
      on = false;
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    text(val, x, y);
    
  }
}
