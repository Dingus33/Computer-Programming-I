// Dallin Mattinson | Conversions | 23 Sep 2024
boolean r,exact;
void setup(){
  size(720, 200);
  stroke(255);
  exact = false;
  r = true;
  frameRate(240);
}

void draw(){
  background(0);
  line(0,150,width,150);
  textAlign(CENTER);
  text("By Dallin Mattinson",70,190);
  text("Left click to switch conversions and right click for exact measurements",530,190);
  textSize(40);
  if(r){
    text("Degrees to Radians",360,65);
    textSize(12);
    if(exact){
      text("Rad: " + degToRad(mouseX-360),width/2,100);
      println("MouseX: " + (mouseX-360) + " : " + degToRad(mouseX-360));
    }else{
      text("Rad: " + degToRad(mouseX-360) + "π",width/2,100);
      println("MouseX: " + (mouseX-360) + " : " + degToRad(mouseX-360));
    }
    for(int i=-360; i<=720; i += 45){
      line(i+360, 145, i+360, 155);
      text(i+"°",i+360,165);
    }
  } else {
    text("Radians to Degrees",360,65);
    textSize(12);
    text("Deg: " + radToDeg(mouseX-360)+"°",width/2,100);
    println("MouseX: " + (mouseX-360) + " : " + radToDeg(mouseX-360));
    for(float i=-360; i<=720; i += 45){
      line(i+360, 145, i+360, 155);
      if (i == 0){
        text(0,360,165);
      } else if(exact){
        text((i/180)*PI,i+360,165);
      }else{
        text(i/180+"π",i+360,165);
      }
    }
  }
}

//Click to switch conversions
void mouseClicked(){
  if(mouseButton == LEFT){
    if(r){
    r = false;
    }else{
    r = true;
    }
  }else if(mouseButton == RIGHT){
    if(exact){
      exact = false;
    }else{
      exact = true;
    }
  }
}

float degToRad (float deg){
  if (exact){
    return (deg*PI)/180;
  }else{
    return deg/180;
  }
}

float radToDeg (float rad){
  return rad *= 2;
}
