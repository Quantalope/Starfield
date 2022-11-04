Particle[] particles;
int count = 500;
float rad = 1;
double centerX, centerY, angleT;
void setup()
{
  angleT = 1;
  noStroke();
  size(1000,1000);
  background(255);
  particles = new Particle[100];
}
void draw()
{
  fill(0,0,0,10);
  rect(0,0,width,height);
  fill(0,0,0,100);
  if(count<222)
  {
    for(int i=0; i<particles.length; i++)
    {
      particles[i].move();
      particles[i].show();
    } 
    centerX = particles[0].X;
    centerY = particles[0].Y;
    count++;
  }
  if(count==222)
  {
    noFill();
    strokeWeight(50);
    stroke(255,0,0);
    ellipse((float)centerX,(float)centerY,rad,rad/2);
    rad = rad * 1.05 + 10;
    noStroke();
  }
}
void mouseClicked()
{
  if(count>100)
  {
    for(int i=2; i<particles.length; i++)
    {
      particles[i] = new Particle(mouseX,mouseY);
    }
    particles[0] = new OddBall(mouseX,mouseY);
    particles[1] = new OddBall2(mouseX,mouseY);
    count=0;
    rad = 1;
  }
}
class Particle
{
  int r, g, b;
  double myX, myY, angle, speed, X, Y, size;
  Particle(int x, int y)
  {
    myX = x;
    myY = y;
    X = x;
    Y = y;
    size = (int)(Math.random()*5+10);
    speed = (Math.random()*10);
    angle = (Math.random()*(2*Math.PI));
    r = (int)(Math.random()*255);
    g = (int)(Math.random()*255);
    b = (int)(Math.random()*255);
  }
  void move()
  {
    myX+=speed*(Math.cos(angle));
    myY+=speed*(Math.sin(angle));
    if(myX>0)
      speed-=dist((float)myX,(float)myY,(float)X,(float)Y)/10000;
    if(myX<0)
      speed+=dist((float)myX,(float)myY,(float)X,(float)Y)/10000;
    if(myY>0)
      speed-=dist((float)myX,(float)myY,(float)X,(float)Y)/10000;
    if(myY<0)
      speed+=dist((float)myX,(float)myY,(float)X,(float)Y)/10000;
  }
  void show()
  {
    fill(r,g,b);
    ellipse((float)myX,(float)myY,(float)size,(float)size);
  }
}
class OddBall extends Particle
{
  OddBall(int x, int y)
  {
    super(x,y);
    X = x;
    Y = y;
    size = 0.5;
    angle = angleT;
    r = (int)(Math.random()*255);
    g = (int)(Math.random()*255);
    b = (int)(Math.random()*255);
  }
  void show()
  {
    translate((float)X,(float)Y);
    scale((float)size);
    noFill();
    strokeWeight(5);
    stroke(r,g,b);
    rotate((float)angle);
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    noStroke();
    rotate(-(float)angle);
    scale((float)(1/size));
    translate(-(float)X,-(float)Y);
  }
  void move()
  {
    size-=0.001*(count-110);
    angle+=0.001*(count-110);
  }
}
class OddBall2 extends Particle
{
  OddBall2(int x, int y)
  {
    super(x,y);
    X = x;
    Y = y;
    size = 0.5;
    r = (int)(Math.random()*255);
    g = (int)(Math.random()*255);
    b = (int)(Math.random()*255);
  }
  void show()
  {
      translate((float)X,(float)Y);
      scale((float)size);
      noFill();
      stroke(255,g,b);
      strokeWeight(3);
      ellipse(0,0,(float)size*6,(float)size*6);
      stroke(r,255,b);
      strokeWeight(2);
      ellipse(0,0,(float)size*3,(float)size*3);
      stroke(r,g,255);
      strokeWeight(1);
      ellipse(0,0,(float)size,(float)size);
      scale((float)(1/size));
      translate(-(float)X,-(float)Y);
      noStroke();
  }
  void move()
  {
    size-=0.001*(count-110);
    angle+=0.005*(count-110);
  }
}
