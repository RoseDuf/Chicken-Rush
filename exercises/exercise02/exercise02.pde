//This program will produce a game with a paddle and a ball. The ball will bouce on the paddle and on the top, right, left walls.
//In general, this is like a one player "PONG" game

//variables for the backgroud with static
color backgroundColor = color(0);
int numStatic = 6000; //CHANGED static is 3 times more powerful/fast
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(0); //CHANGED added varibles for another static effect
int numStatic2 = 50;
color staticColor2 = color(200);
float randomNumber1 = random(255); //CHANGED added 3 new ranom numbers to be able to modify
float randomNumber2 = random(255); //the ball colour
float randomNumber3 = random(255);

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
float ballSpeed = random(2,12); //CHANGED The speed of the ball will be randomily generated instead of constant
int ballSize = 16;
color ballColor = color(255);

//the setup() method
void setup() {
  size(640, 480); //size of the window

  setupPaddle(); //calling setupPaddle() function
  setupBall(); //calling setupBall() function
}

//setupPaddle() function
//gives us the dimensions and speed of the paddle
void setupPaddle() {
  paddleX = width/2; //position of the paddle in x depends on its center
  paddleY = height - paddleHeight; //position of the paddle in y starts from the bottom side
  paddleVX = 0; //paddle velocity
}

//setupBall() function
//gives us the dimensions and speed of the ball
void setupBall() {
  ballX = width/2; //position of the ball in x depends on its center
  ballY = height/2; //position of the ball in y depends on its center
  ballVX = ballSpeed; //ball velocity in x
  ballVY = ballSpeed; //ball velocity in y
}

//draw() function
void draw() {
  //CHANGED took off background to create a fun trail effect

  drawStatic(); //calling drawStatic() function
  drawStatic2();

  updatePaddle(); //calling updatePaddle() function
  updateBall(); //calling updateBall(0) function

  drawPaddle(); //calling drawPaddle() function
  drawBall(); //calling drawBall() function
 // counter(); //CHANGED i'd call the counter function in draw?
}

//drawStatic() function
//gives us the behaviour for the static that will be present with the background
void drawStatic() {
  for (int i = 0; i < numStatic; i++) { //loop from 0 to 5999
    float x = random(0, width); //random location in x
    float y = random(0, height); //random location in y
    float staticSize = random(staticSizeMin, staticSizeMax); //random size
    fill(staticColor); //black colour
    rect(x, y, staticSize, staticSize); //draw the many rectangles to produce static effect
  }
}
//CHANGED added another static to do a glittery star effect
void drawStatic2() {
  for (int i = 0; i < numStatic2; i++) { //loop from 0 to 49
    float x = random(0, width); //random location in x
    float y = random(0, height); //random location in y
    float staticSize = random(staticSizeMin, staticSizeMax); //random size
    fill(staticColor2); //greyish colour
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
  handleBallOffScreen(); //CHANGED calling the new handleBallOffScreen() function
}

//drawPaddle() function
//displays the shape representing the paddle
void drawPaddle() {
  rectMode(CENTER); 
  noStroke();
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  fill(paddleColor);

    for(int i=0; i <= paddleWidth ; i+=5){ //CHANGED for loop to make a rainbow paddle
      //produces random colors for the paddle
      float number1 = random(255); //CHANGED added 3 new ranom numbers to be able to modify
      float number2 = random(255); //the paddle colour
      float number3 = random(255);
      
      int color1 = color(number1,number2,number3);
      fill(color1);
      rect(paddleX - paddleWidth/2 +i, paddleY, 5, paddleHeight); //sill produce glittery striped paddle
      
  }
}
//CHANGED this function will change the colour of the ball whenever it hits a wall of the window at a random colour
void handleBallOffScreen(){ 
  if (ballX + ballSize/2 == width){ //Right wall
    randomNumber1 = random(255);
    randomNumber2 = random(255);
    randomNumber3 = random(255);
    ballColor = color(randomNumber1,randomNumber2,randomNumber3);
    fill(ballColor);
  }
  if (ballX - ballSize/2 == 0){ //Left wall
    randomNumber1 = random(255);
    randomNumber2 = random(255);
    randomNumber3 = random(255);
    ballColor = color(randomNumber1,randomNumber2,randomNumber3);
    fill(ballColor);
  }
  if (ballY - ballSize/2 == 0){ //Top wall
    randomNumber1 = random(255);
    randomNumber2 = random(255);
    randomNumber3 = random(255);
    ballColor = color(randomNumber1,randomNumber2,randomNumber3);
    fill(ballColor);
  }
  
}

//drawBall() function
//displays the shape representing the ball
void drawBall() {
  rectMode(CENTER); 
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

//handleBallHitPaddle() function
//behaviour if the ball hits the paddle
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2; //when ball touches paddle, the ball will move in the Y direction at opposit speed
    ballSpeed = random(2,14); //CHANGED each time ball hits paddle, speed randomizes in X and Y
    ballVY = ballSpeed;
    ballVY = -ballVY;
    
    if (ballVX < 0){
      ballVX = -ballSpeed; //ball speed in X will change at the same speed as in Y
    }
    else{
      ballVX = ballSpeed;
    }
  }
}

boolean ballOverlapsPaddle() { //calling ballOverlapsPaddle() function
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

//handleBallHitWall() function
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


//keyPressed() function
//when the left and right keys are pressed, the paddle will move to the right ow the left 
void keyPressed() {
  if (keyCode == LEFT) { //if key is pressed to the left, the paddle will move at negative speed in the X axis
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) { //if key is pressed to the left, the paddle will move at positive speed in the X axis
    paddleVX = paddleSpeed;
  }
}

//keyReleased() function
//if the keys are released the paddle will cease to move
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  } 
}

void counter(){ //attempting to make a counter

  PFont f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36);
  fill(255);
  
  for(int i=0; i<=20;i++){
    if (ballOffBottom()){
      i-=1;
      print("i");
    }
    if (ballOverlapsPaddle()){
      i+=1;
      print("i");
    }
  }
}
  
  