//the are all of the variables
final int CIRCLE_SPEED = 7;
float randomNumber1 = random(255); //CHANGED added 3 new ranom numbers to be able to modify
float randomNumber2 = random(255); //the background colour everytime you click your mouse
float randomNumber3 = random(255);
final color NO_CLICK_FILL_COLOR = color(250, 100, 100); //pinkish colour
final color CLICK_FILL_COLOR = color(100, 100, 250); //blue colour
color BACKGROUND_COLOR = color(250,150,150); //default background colour (light pink)
final color STROKE_COLOR = color(250, 150, 150); //light pink colour for the contour
int circle_size = 50; //CHANGED diameter of the circle is now variable

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
  background(BACKGROUND_COLOR); //colour of the default background is pink
}

void draw() { //draw method
    //If the mouse is within the boundaries of the moving circle (given by its radius),
    //the fill of the cirlce will go from pink to blue.
    //also, the circle will increasignly get bigger the more your mouse is on the circle
    if (dist(mouseX, mouseY, circleX, circleY) < circle_size/2) {
    fill(CLICK_FILL_COLOR);
      if (circle_size <= 150) //CHANGED the more you mouse is on the cirle, the bigger it gets
      circle_size += 1;
  }
    //else it will just stay pink
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, circle_size, circle_size); //drawing the circle
  circleX += circleVX; //moving the circle in x
  circleY += circleVY; //moving the circle in y
  
  //if circle touches boundary of the window, the circle will move at the same speed but in the opposite
  //direction in x and in y
  
  //to delimit the edges of the circle, we add and subtract the radius of the circle
  if (circleX + circle_size/2 > width || circleX - circle_size/2 < 0) {
    circleVX = -circleVX; ////circle moves in opposite direction in x
  }
  if (circleY + circle_size/2 > height || circleY - circle_size/2 < 0) {
    circleVY = -circleVY; //circle moves in opposite direction in y
    
  }
}

void mousePressed() { //mousePressed method
  //everytime you click your mouse, the window will go back to light pink background 
  //essentially hiding the circle's previous trajectory
  BACKGROUND_COLOR = color(randomNumber1,randomNumber2,randomNumber3); //CHANGED, refresh a new background colour
  background(BACKGROUND_COLOR);
  
  //CHANGED everytime the mouse is pressed, new colours for the background will be generated
  if(mousePressed){
    randomNumber1 = random(255);
    randomNumber2 = random(255);
    randomNumber3 = random(255);
  }
  //CHANGED everytime mouse is pressed, circle is back to original size
  if(mousePressed){
    circle_size = 50;
}
}