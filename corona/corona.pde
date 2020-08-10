//Cell myCell1, myCell2, myCell3, myCell4, myCell5;

Cell[] cells;
int cellsTotal = 20;

PImage background;

void setup() {
  size(808,567);
  background = loadImage("assets/background-1008x567.jpg");

  cells = new Cell[cellsTotal];
  
  for (int i = 0; i < cellsTotal; i++) {
//    cells[i] = new Cell(int(random(127,255)),(width/2)+random(-100,100),(height/2)+random(-100,100),setDirection[int(random(2))],setDirection[int(random(2))]);
//    cells[i] = new Cell(int(random(127,255)),random(size,width-size), random(size,height-size),setDirection[int(random(2))],setDirection[int(random(2))]);
    cells[i] = new Cell();
  }
}    

void draw()  {    
  background(196);
//  image(background, -100, 0);
  
  for (int i = 0; i < cells.length; i++) {
    cells[i].display();
    cells[i].move();
  }
  for (int i = 0; i < cellsTotal-1; i++) {
    for (int j = i + 1; j < cellsTotal; j++) {
      collision(cells[i], cells[j]);
    }
  }
}

void collision(Cell c1, Cell c2){
  //collision code taken from the excellent tutorial by Long Nguyen
  // https://longbaonguyen.github.io/courses/apcsa/apjava.html
  
  // This solution fixes the glitch that occurs
  // with multiple ball collisions.

  float distanceX = c2.xpos - c1.xpos;
  float distanceY = c2.ypos - c1.ypos;
  float distance = sqrt(distanceX*distanceX + distanceY*distanceY);
  
  if(distance < c1.radius + c2.radius){
    //println("touch");
    c1.red = int(random(127,255));
    c2.red = int(random(127,255));
    float angle = atan2(distanceY,distanceX);
    float sin = sin(angle);
    float cos = cos(angle);
    
    float x1 = 0;
    float y1 = 0;
    float x2 = distanceX*cos + distanceY*sin;
    float y2 = distanceY*cos - distanceX*sin;
    
    // rotate velocity
    float xspeed1 = c1.xspeed*cos + c1.yspeed*sin;
    float yspeed1 = c1.yspeed*cos - c1.xspeed*sin;
    float xspeed2 = c2.xspeed*cos + c2.yspeed*sin;
    float yspeed2 = c2.yspeed*cos - c2.xspeed*sin;
    
    
    // resolve the 1D case
    float xspeed1final = ((c1.mass-c2.mass)*xspeed1+2*c2.mass*xspeed2)/(c1.mass+c2.mass);
    float xspeed2final = ((c2.mass-c1.mass)*xspeed2+2*c1.mass*xspeed1)/(c1.mass+c2.mass);
    
    xspeed1 = xspeed1final;
    xspeed2 = xspeed2final;
    
    // fix the glitch by moving ball part equal to the overlap
    // see video for more details (https://youtu.be/guWIF87CmBg)

    float absV = abs(xspeed1) + abs(xspeed2);
    float overlap = (c1.size/2 + c2.size/2) - abs(x1-x2);
    x1 += xspeed1/absV*overlap;
    x2 += xspeed2/absV*overlap;

    // rotate the relative positions back
    float x1final = x1*cos - y1*sin;
    float y1final = y1*cos + x1*sin;
    float x2final = x2*cos - y2*sin;
    float y2final = y2*cos + x2*sin;
    
    
     // finally compute the new absolute positions
    c2.xpos = c1.xpos + x2final;
    c2.ypos = c1.ypos + y2final;
    
    c1.xpos = c1.xpos + x1final;
    c1.ypos = c1.ypos + y1final;
    
    //rotate vel back
    c1.xspeed = xspeed1*cos - yspeed1*sin;
    c1.yspeed = yspeed1*cos + xspeed1*sin;
    c2.xspeed = xspeed2*cos - yspeed2*sin;
    c2.yspeed = yspeed2*cos + xspeed2*sin;
   
      //println(c1.red);
      //println(c2.red);
    
    }  
}