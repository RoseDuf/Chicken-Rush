//CHANGED
// Paddle2
//
// A class that defines a paddle that can be moved left and right on the screen
// using keys passed through to the constructor.

class Paddle2 {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 8;
  int HEIGHT = 16;
  int WIDTH = 160;

  // The position and velocity of the paddle (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;
  
  // The fill color of the paddle
  color paddleColor;

  // The characters used to make the paddle move up and down, defined in constructor
  char rightKey;
  char leftKey;
  char upKey;
  char downKey;

  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, char _rightKey, char _leftKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Paddle2(int _x, int _y, char _rightKey, char _leftKey, color c) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;

    rightKey = _rightKey;
    leftKey = _leftKey;
    
    paddleColor = c;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    x = constrain(x,0 + WIDTH/2, width - WIDTH/2);
  }

  // display()
  //
  // Display the paddle at its location
  
  void display() {
    // Set display properties
    noStroke();
    fill(paddleColor);
    rectMode(CENTER);
    
    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT);
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program
  
  void keyPressed() {
    // Check if the key is our right key
    if (key == rightKey) {
      // If so we want a negative x velocity
      vx = SPEED;
    } // Otherwise check if the key is our left key 
    else if (key == leftKey) {
      // If so we want a positive x velocity
      vx = -SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our right key and the paddle is moving right
    if (key == rightKey && vx > 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our left key and paddle is moving left 
    else if (key == leftKey && vx < 0) {
      // If so it should stop
      vx = 0;
    }
  }
}