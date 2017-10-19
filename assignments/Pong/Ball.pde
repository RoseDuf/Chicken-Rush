// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int speed = 1;
  int size = 16;

  // The location of the ball
  float x;
  float y;

  // The velocity of the ball
  float vx;
  float vy;

  // The colour of the ball
  color ballColor = color(255);


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(float _x, float _y) {
    x = _x;
    y = _y;
    vx = speed;
    vy = speed;
  }
  
  int getSpeed(){
    return speed;
  }
  void setSpeed(int sp){
    speed = sp;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;
   
    if (x < width/2) {
      vx = vx+floor(random(5,15));
      vx = constrain(vx, -100, 100);
    }
    
    else if (x > width/2) {
      vx = vx-floor(random(5,15));
      vx = constrain(vx, -100, 100);
     }
    if (y < height/2) {
      vy = vy+floor(random(5,15));
      vy = constrain(vy, -100, 100);
    }
    
    else if (y > height/2) {
      vy = vy-floor(random(5,15));
      vy = constrain(vy, -100, 100);
     }
  }
  void update2(){
    if (x < width/2) {
      vx = vx+floor(random(5, 10));
      vx = constrain(vx, -50, 50);
    }
    
    else if (x > width/2) {
      vx = vx-floor(random(5, 15));
      vx = constrain(vx, -50, 50);
     }
    else if (y < height/2) {
      vy = vy+floor(random(5, 10));
      vy = constrain(vy, -50, 50);
    }
    
    else if (y > height/2) {
      vy = vy-floor(random(5, 15));
      vy = constrain(vy, -50, 50);
     }
  }
  
  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity
  
  void reset() {
    x = width/2;
    y = height/2;
  }
  
  //CHANGED added a function to stop ball
  void stop(){
    vx = 0;
    vy = 0;
  }
  
  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")
  
  boolean isOffScreenRight() {
    return (x - size/2 > width);
    
  }
  boolean isOffScreenLeft(){
    return (x + size/2 < 0);
  }
  boolean isOffScreenTop(){
    return (y - size/2 > height);
  }
  boolean isOffScreenBottom(){
    return (y - size/2 < 0);
  }

  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + size/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - size/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + size/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - size/2 < paddle.y + paddle.HEIGHT/2);
    
    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom){
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to awlign with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + size/2;
      
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - size/2;
      }
      // And make it bounce
      vx = -vx;
    }
  }
  
  //CHANGED added collision function for the top and bottom paddles
  void collide2(Paddle2 square){
    
    boolean inLeft = (x + size/2 > square.x - square.WIDTH/2);
    boolean inRight = (x - size/2 < square.x + square.WIDTH/2);
    boolean inTop = (y + size/2 > square.y - square.HEIGHT/2);
    boolean inBottom = (y - size/2 < square.y + square.HEIGHT/2);
    
    if (inLeft && inRight && inTop && inBottom){
      if (vy < 0) {
        // Reset its position to awlign with the right side of the paddle
        y = square.y + square.WIDTH/2 + size/2;
      
      } else if (vy > 0) {
        // Reset its position to align with the left side of the paddle
        y = square.y - square.WIDTH/2 - size/2;
      }
      vy = -vy;
    }
  }

  // display()
  //
  // Draw the ball at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    
    //CHANGED color of ball changes to the color of the paddle it hits
    if(vx>0){
    fill(255,99,71); //red
    }
    else {
    fill(65,105,225); //blue
    }
    
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, size, size);
  }
}