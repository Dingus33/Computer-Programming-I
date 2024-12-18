// Dallin Mattinson | Calculator| 2 Oct 2024
Button[] buttons = new Button[23];
String dVal = "";
float l,r,ans;
char op;
boolean left;

void setup(){
  size(375, 450);
  noStroke();
  windowResizable(true);
  l = 0;
  r = 0;
  op = ' ';
  left = true;
  println(sqrt(.5));
}

void draw(){
  buttons[0] = new Button(getX(1.5), getY(5), getWidth(2), getHeight(1), '0', 1, true, false);
  buttons[1] = new Button(getX(0), getY(4), getWidth(1), getHeight(1), '1', 1, true, false);
  buttons[2] = new Button(getX(1), getY(4), getWidth(1), getHeight(1), '2', 1, true, false);
  buttons[3] = new Button(getX(2), getY(4), getWidth(1), getHeight(1), '3', 1, true, false);
  buttons[4] = new Button(getX(0), getY(3), getWidth(1), getHeight(1), '4', 1, true, false);
  buttons[5] = new Button(getX(1), getY(3), getWidth(1), getHeight(1), '5', 1, true, false);
  buttons[6] = new Button(getX(2), getY(3), getWidth(1), getHeight(1), '6', 1, true, false);
  buttons[7] = new Button(getX(0), getY(2), getWidth(1), getHeight(1), '7', 1, true, false);
  buttons[8] = new Button(getX(1), getY(2), getWidth(1), getHeight(1), '8', 1, true, false);
  buttons[9] = new Button(getX(2), getY(2), getWidth(1), getHeight(1), '9', 1, true, false);
  buttons[10] = new Button(getX(0), getY(5), getWidth(1), getHeight(1), '.', 0, false, false);
  buttons[11] = new Button(getX(3), getY(4.5), getWidth(1), getHeight(2), '=', 2, false, false);
  buttons[12] = new Button(getX(4), getY(5), getWidth(1), getHeight(1), '+', 2, false, true);
  buttons[13] = new Button(getX(4), getY(4), getWidth(1), getHeight(1), '-', 2, false, true);
  buttons[14] = new Button(getX(3), getY(3), getWidth(1), getHeight(1), 'X', 0, false, true);
  buttons[15] = new Button(getX(4), getY(3), getWidth(1), getHeight(1), '*', 2, false, true);
  buttons[16] = new Button(getX(3), getY(2), getWidth(1), getHeight(1), '√', 0, false, true);
  buttons[17] = new Button(getX(4), getY(2), getWidth(1), getHeight(1), '÷', 2, false, true);
  buttons[18] = new Button(getX(0), getY(1), getWidth(1), getHeight(1), 'A', 0, false, false);
  buttons[19] = new Button(getX(1), getY(1), getWidth(1), getHeight(1), '!', 0, false, false);
  buttons[20] = new Button(getX(2), getY(1), getWidth(1), getHeight(1), 'π', 0, false, false);
  buttons[21] = new Button(getX(3), getY(1), getWidth(1), getHeight(1), '±', 0, false, false);
  buttons[22] = new Button(getX(4), getY(1), getWidth(1), getHeight(1), 'C', 3, false, false);
  background(0);
  for(int i = 0;i < 23;i++){
    buttons[i].display();
  }
  fill(255);
  rect(getX(2),getY(0),getWidth(5),getHeight(1),20);
  textAlign(RIGHT,CENTER);
  fill(0);
  text('ʸ', getX(3)+25, getY(3)-10);
  text('ʸ', getX(3), getY(2)-6);
  text(dVal,getX(4)+width/11,getY(0));
}

void mouseReleased(){
  for(int i = 0; i < 23;i++){
    if(buttons[i].on){
      if(buttons[i].isNum){
        if(left){
          dVal += buttons[i].val;
          l = float(dVal);
        }else{
          dVal += buttons[i].val;
          r = float(dVal);
        }
      }else if(buttons[i].isOp){
        if(left){
          op = buttons[i].val;
          dVal = "";
          left = false;
        }else{
          calculate();
          op = buttons[i].val;
          dVal = "";
        }
      }else if(buttons[i].val == '.'){
        if(left && !dVal.contains(".")){
          dVal += '.';
          l = float(dVal);
        }else if(!dVal.contains(".")){
          dVal += '.';
          r = float(dVal);
        }
      }else if(buttons[i].val == 'C'){
        dVal = "";
        l = 0;
        r = 0;
        op = ' ';
        left = true;
      }else if(buttons[i].val == '='){
        calculate();
        if(l == int(l)){
          dVal = str(int(l));
        }else{
          dVal = str(l);
        }
      }else if(buttons[i].val == '!'){
        r = l;
        l = 1;
        for(int j = 1;j<=r;j++){
          l *= j;
        }
        dVal = str(int(l));
      }else if(buttons[i].val == '±'){
        if(left){
          l *= -1;
          if(l == int(l)){
            dVal = str(int(l));
          }else{
            dVal = str(l);
          }
        }else{
          r *= -1;
          if(r == int(r)){
            dVal = str(int(r));
          }else{
            dVal = str(r);
          }
        }
      }else if(buttons[i].val == 'π'){
        if(left){
          l = PI;
          dVal = "π";
        }else{
          r = PI;
          dVal = "π";
        }
      }else if(buttons[i].val == 'A'){
          if(left){
            l = ans;
            if(ans == int(ans)){
              dVal = str(int(ans));
            }else{
              dVal = str(ans);
            }
            left = false;
          }else{
            r = ans;
            dVal = str(ans);
          }
      }
    }
  }
  println("Left: " + str(l) + " Op: " + op + " Right: " + str(r) + " Left? " + left);
}

void calculate(){
  if(op == '+'){
    l += r;
  }else if(op == '-'){
    l -= r;
  }else if(op == '*'){
    l *= r;
  }else if(op == '÷'){
    l /= r;
  }else if(op == 'X'){
    l = pow(l, r);
  }else if(op == '√'){
    if(r == 0||r == 2){
      l = sqrt(l);
    }else{
      l = pow(l, 1/r);
    }
  }else if(op == ' '){
    return;
  }else{
    l = 0;
  }
  r = 0;
  ans = l;
  op = ' ';
}

int getY(float x){
  x = x*(height/6)+height/12;
  return int(x);
}
int getX(float x){
  x = x*(width/5)+width/10;
  return int(x);
}

int getWidth(int x){
  int ret = x;
  int z = width/95;
  ret *= (width/5)-z;
  ret += (z*x)-z;
  return ret;
}

int getHeight(int x){
  int ret = x;
  int z = height/95;
  ret *= (height/6)-z;
  ret += (z*x)-z;
  return ret;
}

void keyPressed(){
  if(int(key) >= 48 && int(key) <= 57){
    if(left){
          dVal += key;
          l = float(dVal);
        }else{
          dVal += key;
          r = float(dVal);
        }
  }else if(key == '+'||key == '-'||key == '*'||key == '/'){
    if(left){
      op = key;
      dVal = "";
      left = false;
    }else{
      calculate();
      dVal = "";
      op = key;
    }
  }else if(key == '^'){
    if(left){
      op = 'X';
      dVal = "";
      left = false;
    }else{
      calculate();
      dVal = "";
      op = 'X';
    }
  }else if(key == 'r'||key == 'R'){
    if(left){
      op = '√';
      dVal = "";
      left = false;
    }else{
      calculate();
      dVal = "";
      op = '√';
    }
  }else if(key == '.'){
    if(left && !dVal.contains(".")){
      dVal += '.';
      l = float(dVal);
    }else if(!dVal.contains(".")){
      dVal += '.';
      r = float(dVal);
    }
  }else if(key == 'c'||key == 'C'){
    dVal = "";
    l = 0;
    r = 0;
    op = ' ';
    left = true;
  }else if(key == '='||int(key) == 10){
    calculate();
    if(l == int(l)){
      dVal = str(int(l));
    }else{
      dVal = str(l);
    }
  }else if(key == '!'){
    r = l;
    l = 1;
    for(int j = 1;j<=r;j++){
      l *= j;
    }
    dVal = str(int(l));
  }else if(key == '_'){
    if(left){
      l *= -1;
      if(l == int(l)){
        dVal = str(int(l));
      }else{
        dVal = str(l);
      }
    }else{
      r *= -1;
      if(r == int(r)){
        dVal = str(int(r));
      }else{
        dVal = str(r);
      }
    }
  }else if(key == 'p'||key == 'P'){
    if(left){
      l = PI;
      dVal = "π";
    }else{
      r = PI;
      dVal = "π";
    }
  }else if(key == 'a'||key == 'A'){
    if(left){
      l = ans;
      if(ans == int(ans)){
        dVal = str(int(ans));
      }else{
        dVal = str(ans);
      }
      left = false;
    }else{
      r = ans;
      dVal = str(ans);
    }
  }
  println("Left: " + str(l) + " Op: " + op + " Right: " + str(r) + " Left? " + left);
}
