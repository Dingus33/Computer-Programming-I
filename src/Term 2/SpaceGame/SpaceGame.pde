// Dallin Mattinson | 6 Nov 2024 | SpaceGame

Ship s1;
int score = 0, level = 1, hp = 100, ammo = 30, lives = 2, lastFire, fireRate = 400, start, unlimTime, multiTime, strokeR, strokeB, invTime, waveTime;
boolean play, set, playB, setB, exitB, w,a,s,d,e, unlim, multi, inv, wave;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Power> powers = new ArrayList<Power>();

void setup(){
  size(1000,1000);
  s1 = new Ship();
  noStroke();
  frameRate(60);
}

void draw(){
  if(unlim || multi){
    stroke(strokeR,0,strokeB);
  }
  background(0);
  if(random(10) < 1){
    stars.add(new Star(floor(random(1001)), -5, 1 ,1+ceil(random(2))));      
  }
  if(stars.size() > 0){
    for(int i = 0;i < stars.size();i++){
      Star str = stars.get(i);
      str.display();
    }
  }
  if(play){
    if(powers.size() > 0){
      for(int i = 0;i < powers.size();i++){
        Power pwr = powers.get(i);
        pwr.display();
        if(pwr.hit){
          powers.remove(i);
        }
        if(pwr.y > height+10){
          powers.remove(i);
        }
      }
    }
    if(e){
      if(unlim && millis() - lastFire > fireRate/3){
        lasers.add(new Laser(s1.x,s1.y, 0));
        if(multi){
          lasers.add(new Laser(s1.x+30,s1.y,7));
          lasers.add(new Laser(s1.x-30,s1.y,-7));
        }
        lastFire = millis();
      }else if(ammo > 0 && millis() - lastFire > fireRate){
        lasers.add(new Laser(s1.x,s1.y,0));
        if(multi){
          lasers.add(new Laser(s1.x+30,s1.y,4));
          lasers.add(new Laser(s1.x-30,s1.y,-4));
        }
        lastFire = millis();
        ammo--;
      }
    }
    if(unlim && millis() - unlimTime > 10000){
      unlim = false;
      strokeB = 0;
      noStroke();
    }
    if(multi && millis() - multiTime > 15000){
      multi = false;
      strokeR = 0;
      noStroke();
    }
    if(inv && millis() - invTime > 10000){
      inv = false;
    }
    if(wave && millis() - waveTime > 15000){
      wave = false;
    }
    if(lasers.size() > 0){
      for(int i = 0;i < lasers.size();i++){
        Laser lzr = lasers.get(i);
        lzr.display();
        if(lzr.y < -10){
          lasers.remove(i);
        }
      }
    }
    s1.display();
    if(random(50) < 1){
      rocks.add(new Rock(floor(random(1001)), -20, ceil(random(3)),3*ceil(random(10)+10)));      
    }
    if(rocks.size() > 0){
      for(int i = 0;i < rocks.size();i++){
        Rock rk = rocks.get(i);
        rk.display();
      }
    }
    if(wave){
      fill(255,128,0,32);
      rect(0,0,width,height);
    }
    text((millis()-start)/1000, 30, width-60);
  }else if(set){
    
  }else{
    textSize(150);
    textAlign(CENTER,CENTER);
    text("Space Game",width/2,height/4);
    textSize(75);
    text("Play",width/2,height/2);
    text("Exit",width/2,3*height/4);
    text("Settings",width/2,5*height/8);
    if(mouseX >= width/2-70 && mouseX <= width/2+70 && mouseY >= height/2-30 && mouseY <= height/2+30){
      playB = true;
      cursor(HAND);
    }else if(mouseX >= width/2-130 && mouseX <= width/2+130 && mouseY >= 5*height/8-30 && mouseY <= 5*height/8+30){
      setB = true;
      cursor(HAND);
    }else if(mouseX >= width/2-60 && mouseX <= width/2+60 && mouseY >= 3*height/4-30 && mouseY <= 3*height/4+30){
      exitB = true;
      cursor(HAND);
    }else{
      cursor(ARROW);
    }
  }
  textAlign(LEFT,TOP);
  textSize(25);
  fill(255);
  text(frameRate,0,0);
}

void destroy(int obj){
  if(ceil(random(3)) == 1){
      powers.add(new Power(rocks.get(obj).x, rocks.get(obj).y, ceil(random(10))));
    }
    rocks.remove(obj);
}

void powerUp(char abil){
  switch(abil){
    case 'a':
      ammo += 5;
      break;
    case 'h':
      hp = 100;
      break;
    case 'u':
      unlim = true;
      unlimTime = millis();
      strokeB = 255;
      break;
    case 'm':
      multi = true;
      multiTime = millis();
      strokeR = 255;
      break;
    case 'i':
      inv = true;
      invTime = millis();
      break;
    case 'k':
      if(rocks.size() > 0){
        for(int i = rocks.size()-1;i > 0;i--){
          destroy(i);
        }
      }
      break;
    case 'w':
      wave = true;
      waveTime = millis();
      break;
  }
}

void hit(int dam){
  hp -= dam;
  if(hp <= 0){
    lose();
  }
}

void lose(){
  exit();
}

void mousePressed(){
  if(!play){
    if(playB){
      play = true;
      start = millis();
      noCursor();
    }else if(setB){
      set = true;
    }else if(exitB){
      exit();
    }
  }
}

void keyPressed(){
  switch(key){
    case 'w':
    case 'W':
      w = true;
      break;
    case 'a':
    case 'A':
      a = true;
      break;
    case 's':
    case 'S':
      s = true;
      break;
    case 'd':
    case 'D':
      d = true;
      break;
    case 'e':
    case 'E':
    case ' ':
      e = true;
      break;
  }
}

void keyReleased(){
  switch(key){
    case 'w':
    case 'W':
      w = false;
      break;
    case 'a':
    case 'A':
      a = false;
      break;
    case 's':
    case 'S':
      s = false;
      break;
    case 'd':
    case 'D':
      d = false;
      break;
    case 'e':
    case 'E':
    case ' ':
      e = false;
      break;
  }
}

void keyTyped(){
  switch(key){
    case 'q':
    case 'Q':
      break;
    case 'p':
    case 'P':
      play = false;
      cursor();
      break;
  }
}
