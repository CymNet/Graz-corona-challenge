class Cell {
  color green;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  Cell(color cellColor, float cellX, float cellY, float cellSpeedX, float cellSpeedY) {
    green = cellColor;
    xpos = cellX;
    ypos = cellY;
    xspeed = cellSpeedX * random(0.5,0.9);
    yspeed = cellSpeedY * random(0.5,0.9);
  }
  
  // collision code is taken from the excellent tutorial by Long Nguyen
  // https://longbaonguyen.github.io/courses/apcsa/apjava.html
  // https://www.youtube.com/watch?v=guWIF87CmBg
  
  void display(){
    ellipseMode(CENTER);
    fill(0,green,0);
    ellipse(xpos,ypos,20,20);
  }
  
  void move(){
    xpos = xpos + xspeed;
    if (xpos > width-10 || xpos < 10) {
      xspeed = xspeed * -1;
    }
    ypos = ypos + yspeed;
    if (ypos > height-10 || ypos < 10) {
      yspeed = yspeed * -1;
    } 
  }
}