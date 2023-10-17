Chemotaxis[] dog;
PImage bg;

void setup(){
  size(400,400);
  dog = new Chemotaxis[(int)(Math.random()*20)+5];
  for(int i = 0; i < dog.length; i++)
    dog[i] = new Chemotaxis((int)(Math.random()*400),(int)(Math.random()*400));
  bg = loadImage("grass.jpg");
  background(bg);
}

void draw(){
  for(int i = 0; i < dog.length; i++){
    dog[i].show();
    dog[i].move();
  }
  fill(0,200,0);
  stroke(1);
  if(mousePressed)
    ellipse(mouseX, mouseY, 30, 30);
  textAlign(CENTER);
  fill(255);
  textSize(25);
  text("Hold the mouse to catch the ball!", 200, 380);
}

class Chemotaxis{
  color myC;
  int myX, myY, myR, moveX, moveY;
  Chemotaxis(int x, int y){
    myX = x;
    myY = y;
    myC = 0;
    myR = (int)(Math.random()*4)+1;
    //random walk
    moveX = (int)(Math.random()*3)+1;
    moveY = (int)(Math.random()*3)+1;
  }
 
 void show(){
   if (myR == 1)
     myC = color(219,202,169);
   else if(myR == 2)
     myC = color(148,100,12);
   else if(myR == 3)
     myC = color(61,46,18);
   else
     myC = color(102,91,70);
   fill(myC);
   noStroke();
   ellipse(myX, myY, 40, 40);
   ellipse(myX-15, myY-20, 15, 20);
   ellipse(myX+15, myY-20, 15, 20);
   //eyes
   fill(255);
   ellipse(myX-8, myY-3, 7, 7);
   ellipse(myX+8, myY-3, 7, 7);
   fill(0);
   ellipse(myX-8, myY-2, 6, 6);
   ellipse(myX+8, myY-2, 6, 6);
 }
 
 void move(){
   if(mousePressed){
     if(mouseX > myX)
       myX += moveX;
     else myX -= moveX;
     if(mouseY > myY)
       myY += moveY;
     else myY -= moveY;
   }
   else{
      myX = myX + (int)(Math.random()*5)-2;
      myY = myY + (int)(Math.random()*5)-2;
    }
 }
}
