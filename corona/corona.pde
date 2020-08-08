//Cell myCell1, myCell2, myCell3, myCell4, myCell5;

Cell[] cells;
int cellsTotal = 120;

PImage background;

void setup() {
  size(808,567);
  background = loadImage("assets/background-1008x567.jpg");
  int[] setSpeed = {-1,1};

  cells = new Cell[cellsTotal];
  for (int i = 0; i < cellsTotal; i++) {
    cells[i] = new Cell(int(random(127,255)),(width/2)+random(-100,100),(height/2)+random(-100,100),setSpeed[int(random(2))],setSpeed[int(random(2))]);
  }
}    

void draw()  {    
  background(196);
  image(background, -100, 0);
  for (int i = 0; i < cellsTotal; i++) {
    cells[i].move();
    cells[i].display();
  }
}