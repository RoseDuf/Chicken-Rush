// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Score p1;
Score p2;

int num1 = 0;
int num2 = 0;
color p1color = color(255,99,71);
color p2color = color(65,105,225);

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  //CHANGED added two scoring objects, one red and one blue
  p1 = new Score(num1,320,200, p1color); 
  p2 = new Score(num2,320,280, p2color);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  
  //CHANGED if ball reaches right side of screen, a point for
  //player 1 is given
 if(ball.isOffScreenRight()){
    p1.setNum(num1);
    num1 = p1.getNum()+1; //increment score by 1
  }
  //CHANGED if ball reaches left side of screen, a point for
  //player 2 is given
  if(ball.isOffScreenLeft()){
    p2.setNum(num2);
    num2 = p2.getNum()+1; //increment score by 1
  }
  
  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreenRight()||ball.isOffScreenLeft()) {
    // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  
  //CHANGED display scores
  p1.display();
  p2.display();
  
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}