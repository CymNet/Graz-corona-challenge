class Cell {
  color red;
  color green;
  float xpos;
  float ypos;
  float size;
  float radius;
  float xspeed;
  float yspeed;
  float mass; //temp float
  int[] setDirection = {-1,1};


//    cells[i] = new Cell(int(random(127,255)),(width/2)+random(-100,100),(height/2)+random(-100,100),setDirection[int(random(2))],setDirection[int(random(2))]);
//    cells[i] = new Cell(int(random(127,255)),random(size,width-size), random(size,height-size),setDirection[int(random(2))],setDirection[int(random(2))]);


//  Cell(color cellColor, float cellX, float cellY, int xdir, int ydir) {
//  Cell(color cellColor, float cellX, float cellY) {
    Cell() {
      size = 50;
      radius = size/2;
      red = 0;
      green = int(random(127,255));

      xpos = random(2*size, width-(2*size));
      ypos = random(2*size, height-(2*size));
  
      xspeed = setDirection[int(random(2))] * random(0.5,0.9);
      yspeed = setDirection[int(random(2))] * random(0.5,0.9);
      
      mass = size/100;
    }
  
  // collision code is taken from the excellent tutorial by Long Nguyen
  // https://longbaonguyen.github.io/courses/apcsa/apjava.html
  // https://www.youtube.com/watch?v=guWIF87CmBg
  
  void display(){
    ellipseMode(CENTER);
    fill(red,green,0);
    ellipse(xpos,ypos,size,size);
  }
  
  void move(){
    xpos = xpos + xspeed;
    if (xpos > width - size/2 || xpos < size/2) {
      xpos = xpos - xspeed;
      xspeed = xspeed * -1;
    }
    ypos = ypos + yspeed;
    if (ypos > height - size/2 || ypos < size/2 ) {
      ypos = ypos - yspeed;
      yspeed = yspeed * -1;
    } 
  }
}