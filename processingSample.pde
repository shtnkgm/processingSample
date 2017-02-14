void setup(){
  size(1000, 1000);
  background(0);
  frameRate(60);
  
  smooth();
}

float x = 250;
float y = 250;
float r = 20;

float d = 50;
float dx1 = 4;
float dx2 = 4;
float dy1 = 4;
float dy2 = 4;
float x1 = 500;
float y1 = 500;
float x2 = 500;
float y2 = 500;

float dColor = 4;
float red = 122;
float green = 122;
float blue = 122;
float alpha = 100;

float ballX = 500;
float ballY = 500;
float balldX = random(-10,10);
float balldY = random(-10,10);
float ballSize = 20;
float ballStop = 0;

int second = -1;

void draw(){
  smooth();
   
  //moveBall();
  //drawBall();
   
  //fade();
  
  drawText();
  drawLine();
}

void fade(){
  fill(0,50);
  noStroke();
  rect(0,0,width,height);
}

void drawText(){
  textSize(100);
  textAlign(CENTER);
  //randomColor();
  //fill(red,blue,green,130);
  fill(0,0,0,255);
  text("Processing",500,500);
}

void randomColor(){
  red = red + random(-dColor,dColor);
  red = ocha(red);
  green = green + random(-dColor,dColor);
  green = ocha(green);
  blue = blue + random(-dColor,dColor);
  blue = ocha(blue);
}

void drawLine(){
  randomColor();
  noFill();  
  stroke(red,green,blue,alpha);
  strokeWeight(1);
  
  dx1 = random(d);
  dx2 = random(d);
  dy1 = random(d);
  dy2 = random(d);

  x1 = x1 + random(-dx1, dx1);
  y1 = y1 + random(-dy1, dy1);
  x2 = x2 + random(-dx2, dx2);
  y2 = y2 + random(-dy2, dy2);
  
  x1 = hako(x1);
  x2 = hako(x2);
  y1 = hako(y1);
  y2 = hako(y2);

  float x3 = random(1000);
  float y3 = random(1000);
  
  line(x1,y1,x2,y2);
  line(x1,y1,x3,y3);
  line(x2,y2,x3,y3);  
}

void drawBall(){
  //fill(255,100);
  //noStroke();
  noFill();
  stroke(255,100);
  strokeWeight(2);
  
  ellipse(ballX,ballY,ballSize,ballSize);
  
}

void moveBall(){  
  balldX = noise(random(1000)) * 10 * random(-1,1);
  balldY = noise(random(1000)) * 10 * random(-1,1);
  
  ballSize = ballSize + noise(random(1000)) * random(-1,1);
  
  ballX = ballX + balldX;
  ballY = ballY + balldY;
  
  reflect();
  
  ballX = hako(ballX);
  ballY = hako(ballY); 

}

void mouseMoved(){
  ballX = hako(mouseX);
  ballY = hako(mouseY);
}

// 0 ~ 255
float ocha(float ocha){
  if(ocha < 0){
    ocha = 0;
  }else if (255 < ocha){
    ocha = 255;
  }
  return ocha;
}

float hako(float hako){
  float bias = 4;
  
  if(hako - ballSize/2.0 - bias < 0){
    hako = 0 + ballSize/2.0 + bias;
  }else if (width < hako + ballSize/2.0 + bias){
    hako = width - ballSize/2.0 - bias;
  }
  return hako;
}

void reflect(){
  float bias = 4;
  
  if(ballX - ballSize/2.0 - bias < 0){
    balldX = -balldX;
    //balldX = balldX * 1.2;
  }else if(width < ballX + ballSize/2.0 + bias){
    balldX = -balldX;
    //balldX = balldX * 1.2;
  }
  
  if(ballY - ballSize/2.0 - bias < 0){
    balldY = -balldY;
    //balldY = balldY * 1.2;
  }else if(width < ballY + ballSize/2.0 + bias){
    balldY = -balldY;
    //balldY = balldY * 1.2;
  }
}