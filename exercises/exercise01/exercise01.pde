//the are all of the variables
final int CIRCLE_SPEED = 7;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100); //pinkish colour
final color CLICK_FILL_COLOR = color(100, 100, 250); //blue colour
final color BACKGROUND_COLOR = color(250, 150, 150); //default background colour (light pink)
final color STROKE_COLOR = color(250, 150, 150); //light pink colour for the contour
final int CIRCLE_SIZE = 50; //diameter of the circle

int circleX; //circle position variable in X
int circleY; //circle position variable in Y
int circleVX; //circle speed variable in X
int circleVY; //circle speed variable in Y

void setup() { //setup method
  size(640, 480); //size of the window
  circleX = width/2; //circle radius in X
  circleY = height/2; //circle radius in Y
  circleVX = CIRCLE_SPEED; //setup circle speed in x
  circleVY = CIRCLE_SPEED; //setup circle speed in y
  stroke(STROKE_COLOR); //colour of the circle's contour
  fill(NO_CLICK_FILL_COLOR); //colour of the circle when the mouse isn't on it
  background(BACKGROUND_COLOR); //light pink background
}

void draw() { //draw method
    //If the mouse is within the boundaries of the moving circle (given by its radius),
    //the fill of the cirlce will go from pink to blue.
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  }
    //else it will just stay pink
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); //drawing the circle
  circleX += circleVX; //moving the circle in x
  circleY += circleVY; //moving the circle in y
  
  //if circle touches boundary of the window, the circle will move at the same speed but in the opposite
  //direction in x and in y
  
  //to delimit the edges of the circle, we add and subtract the radius of the circle
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX; ////circle moves in opposite direction in x
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY; //circle moves in opposite direction in y
  }
}

void mousePressed() { //mousePressed method
  //everytime you click your mouse, the window will go back to light pink background 
  //essentially hiding the circle's previous trajectory
  background(BACKGROUND_COLOR);
}