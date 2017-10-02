//variables for the backgroud with static
color backgroundColor = color(0);
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

//variables for the paddle (position x and y, speed x, colour)
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

//variables for the ball (position x and y,speed x and y, colour)
int ballX;
int ballY;
float ballVX;
float ballVY;
float ballSpeed = random(2,12); //The speed of the ball will be randomily generated instead of constant
int ballSize = 16;
color ballColor = color(255);

//the setup() method
void setup() {
  size(640, 480); //size of the window

  setupPaddle(); //calling setupPaddle() method
  setupBall(); //calling setupBall() method
}

//setupPaddle() method
//gives us the dimensions and speed of the paddle
void setupPaddle() {
  paddleX = width/2; //position of the paddle in x depends on its center
  paddleY = height - paddleHeight; //position of the paddle in y starts from the bottom side
  paddleVX = 0; //paddle velocity
}

//setupBall() method
//gives us the dimensions and speed of the ball
void setupBall() {
  ballX = width/2; //position of the ball in x depends on its center
  ballY = height/2; //position of the ball in y depends on its center
  ballVX = ballSpeed; //ball velocity in x
  ballVY = ballSpeed; //ball velocity in y
}

//draw() method
void draw() {
  background(backgroundColor); //include background first

  drawStatic(); //calling drawStatic() method

  updatePaddle(); //calling updatePaddle() method
  updateBall(); //calling updateBall(0) method

  drawPaddle(); //calling drawPaddle() method
  drawBall(); //calling drawBall() method
}

//drawStatic(0) method
//gives us the behaviour for the static that will be present with the background
void drawStatic() {
  for (int i = 0; i < numStatic; i++) { //loop from 0 to 999
    float x = random(0, width); //random location in x
    float y = random(0, height); //random location in y
    float staticSize = random(staticSizeMin, staticSizeMax); //random size
    fill(staticColor); //greyish colour
    rect(x, y, staticSize, staticSize); //draw the many rectangles to produce static effect
  }
}

//updatePaddle()
//gives us the behaviour of the paddle
void updatePaddle() {
  paddleX += paddleVX;  //give paddle movement
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2); //paddle position cannot exceed the limits of the center position
}

//updateBall()
//gives us the behaviour of the ball
void updateBall() {
  //give ball movement
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle(); //calling handleBallHitPaddle()
  handleBallHitWall(); //calling handleBallHitWall()
  handleBallOffBottom(); //calling handleBallOffBottom()
}

//drawPaddle() method
//displays the shape representing the paddle
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//drawBall() method
//displays the shape representing the ball
void drawBall() {
  rectMode(CENTER); 
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

//handleBallHitPaddle() method
//behaviour if the ball hits the paddle
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2; //when ball touches paddle, the ball will move in the Y direction at opposit speed
    ballSpeed = random(2,12); //CHANGED each time ball hits paddle, speed randomizes in X and Y
    ballVY = ballSpeed;
    ballVX = ballSpeed; //HOW THE DOES THIS WORK
    ballVY = -ballVY;
    
    
  }
}

boolean ballOverlapsPaddle() { //calling ballOverlapsPaddle() method
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) { //makes sure that the contact between the paddle and the ball is distiguished by their edges
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

//handleBallOffBottom()
//ball behaviour if it hits the bottom of the window
void handleBallOffBottom() {
  if (ballOffBottom()) { //if the ball touches the bottom of the screen, the ball will reset at the middle of the window screen
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() { //calling  ballOffBottom() method
  return (ballY - ballSize/2 > height);
}

//handleBallHitWall() method
//ball behaviour if it hits the sides of the window
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) { //if ball hits the wall, it will bouced back in the opposite direction withe the same speed in the X axis
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) { //if ball hits the wall, it will bouced back in the opposite direction with the same speed in the Y axis
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

//keyPressed() method
//when the left and right keys are pressed, the paddle will move to the right ow the left 
void keyPressed() {
  if (keyCode == LEFT) { //if key is pressed to the left, the paddle will move at negative speed in the X axis
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) { //if key is pressed to the left, the paddle will move at positive speed in the X axis
    paddleVX = paddleSpeed;
  }
}

//keyReleased() method
//if the keys are released the paddle will cease to move
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}