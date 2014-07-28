PImage rockimg;
PImage paperimg;
PImage scissorsimg;
PImage noneimg;

int pdis = 0;
int cdis = 0;
int mode = 0;
int modes = 6;
int better = -1;
int hislen = 1000;

int pwins = 0;
int cwins = 0;

int[] his = new int[1000];

void setup() {
  size(600,800);
  rockimg = loadImage("rock.jpg","jpg");
  paperimg = loadImage("paper.jpg","jpg");
  scissorsimg = loadImage("scissors.jpg","jpg");
  noneimg = loadImage("none.jpg","jpg");
  
  
  
  
  
  
}

void draw() {
  
  fill(0);
  image(noneimg,0,0);
  
  switch(pdis){
    case 0:
      image(noneimg,0,400);
      break;
    case 1:
      image(rockimg,0,400);
      break;
    case 2:
      image(paperimg,0,400);
      break;
    case 3:
      image(scissorsimg,0,400);
      break;
  }
  
  switch(cdis){
    case 0:
      image(noneimg,0,0);
      break;
    case 1:
      image(rockimg,0,0);
      break;
    case 2:
      image(paperimg,0,0);
      break;
    case 3:
      image(scissorsimg,0,0);
      break;
  }
  
  switch(mode){
    case 0:
      text("Rock Mode",20,20);
      break;
    case 1:
      text("Paper Mode",20,20);
      break;
    case 2:
      text("Scissors Mode",20,20);
      break;
    case 3:
      text("Random Mode",20,20);
      break;
    case 4:
      text("Smart Mode",20,20);
      break;
    case 5:
      text("Cheat Mode",20,20);
      break;
  }
  
  text("Computer Wins "+cwins,480,20);
  text("Player Wins "+pwins,480,420);
  
  
  noFill();
  stroke(0,255,0);
  strokeWeight(10);
  rectMode(CORNER);
  rect(5,5+400*better,600-1-10,400-1-10);
  strokeWeight(1);
  
}


void keyPressed(){
  boolean pressed = false;
  if(key == '1'){
    pdis = 1;
    pressed = true;
  }
  if(key == '2'){
    pdis = 2;
    pressed = true;
  }
  if(key == '3'){
    pdis = 3;
    pressed = true;
  }
  
  
  
  if(pressed){
    switch(mode){
      case 0:
        cdis = 1;
        break;
      case 1:
        cdis = 2;
        break;
      case 2:
        cdis = 3;
        break;
      case 3:
        cdis = 1+floor(random(3));
        break;
      case 4:
        counter(findHis());
        break;
      case 5:
        counter(pdis);
        break;
    }
    
  }
  checkBetter(); 
  
  for(int i=hislen-2; i>=0; i-=1){
    his[i+1] = his[i];
  }
  his[0] = pdis;
  
}

void mousePressed() {
  mode++;
  if(mode >= modes){
    mode = 0;
  }
}

boolean checkBetter(){
  better = 0;
  
  if(cdis == 1){
    if(pdis == 1){
      better = -1;
    }
    if(pdis == 2){
      better = 1;
    }
    if(pdis == 3){
      better = 0;
    }
  }
  
  if(cdis == 2){
    if(pdis == 1){
      better = 0;
    }
    if(pdis == 2){
      better = -1;
    }
    if(pdis == 3){
      better = 1;
    }
  }
  
  if(cdis == 3){
    if(pdis == 1){
      better = 1;
    }
    if(pdis == 2){
      better = 0;
    }
    if(pdis == 3){
      better = -1;
    }
  }
  
  if(better == 0){
    cwins++;
  } else if(better == 1){
    pwins++;
  }
  
  return true;
}

boolean counter(int tempplay){
  if(tempplay > 0){
    switch(tempplay){
      case 1:
        cdis = 2;
        break;
      case 2:
        cdis = 3;
        break;
      case 3:
        cdis = 1;
        break;
    }
  } else {
    cdis = 1+floor(random(3));
  }
  return true;
}

int findHis(){
  int myreturn = 0;
  for(int i = 3; i<hislen; i++){
    
    if(his[2] == his[i]){
      if(his[1] == his[i-1]){
        if(his[0] == his[i-2]){
          if(myreturn == 0){
            myreturn = his[i-3];
          }
        }
      }
    }
  }
  return myreturn;
}
