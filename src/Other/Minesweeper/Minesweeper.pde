boolean start = true, exp = false, solved = false;
int ammount = 25, dif = 25, click, sz = 900, size = sz/ammount;
boolean[] bombs = new boolean[int(sq(ammount))];
boolean[] safe = new boolean[int(sq(ammount))];
boolean[] flagged = new boolean[int(sq(ammount))];
int[] near = new int[int(sq(ammount))];
void setup(){
  size(900,900);
  noStroke();
  textAlign(CENTER,CENTER);
  frameRate(240);
  PFont font = createFont("mine-sweeper.ttf",30);
  textFont(font);
}

void draw(){
  for(int i = 0;i < sq(ammount);i++){
    if(safe[i]){
      if(i % 2 == 1){
        fill(140,80,0);
      }else{
        fill(125,60,0);
      }
    }else{
      if(i == click && exp){
        fill(255,0,0);
      }else if(i % 2 == 1){
        fill(0,255,0);
      }else{
        fill(0,200,0);
      }
    }
    rect(size*(i % ammount),size*floor(i / ammount),size,size);
    if(flagged[i]){
      fill(255,0,0);
      text('`',size*(i % ammount)+(size)/2,size*floor(i / ammount)+(size)/2);
    }
    if(safe[i] && near[i] != 0){
      if(near[i] == 1){
        fill(0,0,255);
      }else if(near[i] == 2){
        fill(0,255,0);
      }else if(near[i] == 3){
        fill(255,0,0);
      }else if(near[i] == 4){
        fill(0,0,128);
      }else if(near[i] == 5){
        fill(128,0,0);
      }else if(near[i] == 6){
        fill(0,128,255);
      }else if(near[i] == 7){
        fill(0);
      }else if(near[i] == 8){
        fill(128);
      }
      text(near[i],size*(i % ammount)+size/2,size*floor(i / ammount)+size/2);
    }
  }
  if(exp){
    fill(255,0,0,128);
    rect(0,0,sz,sz);
  }else if(solved){
    fill(0,255,0,128);
    rect(0,0,sz,sz);
  }
}

void mouseClicked(){
  if(!exp && !solved){
    click = ammount*floor(mouseY/size)+floor(mouseX/size);
    if(mouseButton == LEFT){
      if(flagged[click]){
        return;
      }
      if(start){
        safe[click] = true;
        int x;
        start = false;
        for(int i = 0;i < dif;i++){
          x = floor(random(sq(ammount)));
          if(bombs[x]||x == click){
            i--;
            continue;
          }
          bombs[x] = true;
        }
        for(int i = 0;i < sq(ammount);i++){
          findBombs(i);
        }
      }
      if(!bombs[click]){
        safe[click] = true;
        check(click);
      }else{
        println("Connection lost");
        exp = true;
      }
    }else if(mouseButton == RIGHT){
      if(!safe[click]){
        if(flagged[click]){
          flagged[click] = false;
        }else{
          flagged[click] = true;
        }
      }
    }
  }
}

void findBombs(int x){
  if(x >= ammount){
    if(bombs[x-ammount]){
      near[x]++;
    }
  }
  if(x % ammount != 0){
    if(bombs[x-1]){
      near[x]++;
    }
  }
  if((x+1) % ammount != 0){
    if(bombs[x+1]){
      near[x]++;
    }
  }
  if(sq(ammount)-ammount > x){
    if(bombs[x+ammount]){
      near[x]++;
    }
  }
  if(x >= ammount && x % ammount != 0){
    if(bombs[x-ammount-1]){
      near[x]++;
    }
  }
  if(x >= ammount && (x+1) % ammount != 0){
    if(bombs[x-ammount+1]){
      near[x]++;
    }
  }
  if(sq(ammount)-ammount > x && x % ammount != 0){
    if(bombs[x+ammount-1]){
      near[x]++;
    }
  }
  if(sq(ammount)-ammount > x && (x+1) % ammount != 0){
    if(bombs[x+ammount+1]){
      near[x]++;
    }
  }
}

void check(int x){
  if(near[x] == 0){
    if(x >= ammount){
      if(!safe[x-ammount]){
        flagged[x-ammount] = false;
        safe[x-ammount] = true;
        check(x-ammount);
      }
    }
    if(x % ammount != 0){
      if(!safe[x-1]){
        flagged[x-1] = false;
        safe[x-1] = true;
        check(x-1);
      }
    }
    if((x+1) % ammount != 0){
      if(!safe[x+1]){
        flagged[x+1] = false;
        safe[x+1] = true;
        check(x+1);
      }
    }
    if(sq(ammount)-ammount > x){
      if(!safe[x+ammount]){
        flagged[x+ammount] = false;
        safe[x+ammount] = true;
        check(x+ammount);
      }
    }
    if(x >= ammount && x % ammount != 0){
      if(!safe[x-ammount-1]){
        flagged[x-ammount-1] = false;
        safe[x-ammount-1] = true;
        check(x-ammount-1);
      }
    }
    if(x >= ammount && (x+1) % ammount != 0){
      if(!safe[x-ammount+1]){
        flagged[x-ammount+1] = false;
        safe[x-ammount+1] = true;
        check(x-ammount+1);
      }
    }
    if(sq(ammount)-ammount > x && x % ammount != 0){
      if(!safe[x+ammount-1]){
        flagged[x+ammount-1] = false;
        safe[x+ammount-1] = true;
        check(x+ammount-1);
      }
    }
    if(sq(ammount)-ammount > x && (x+1) % ammount != 0){
      if(!safe[x+ammount+1]){
        flagged[x+ammount+1] = false;
        safe[x+ammount+1] = true;
        check(x+ammount+1);
      }
    }
  }
  int unsafe = 0;
  for(int i = 0;i < sq(ammount);i++){
    if(!safe[i]){
      unsafe++;
    }
  }
  println(unsafe);
  if(unsafe == ammount){
    solved = true;
  }
}
