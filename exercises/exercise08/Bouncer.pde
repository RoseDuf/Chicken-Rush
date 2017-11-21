// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity and stays in position, rotating on itself,
// when a key is pressed 

class Bouncer {

  //using vectors instead of variables for positions and speeds
  //for more control of the bouncers
  PVector location;
  PVector velocity;
  
  //varibles to let you choose the initial locationa nd speed of the bouncers
  float x;
  float y;
  float vx;
  float vy;

  // The size of the Bouncer
  float size;

  // The default fill colour of the Bouncer
  color defaultColor;
  
  //varibles for rotate
  float theta = 0;
  boolean[] keys = new boolean[1]; //stick with 1 key for now

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  // Creates a Bouncer with the provided values by remembering them.
  Bouncer(float _x, float _y, float _vx, float _vy, float tempSize, color tempDefaultColor) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    location = new PVector(x,y);
    velocity = new PVector(vx,vy);
    size = tempSize;
    defaultColor = tempDefaultColor;
  }

  // update()
  // Adds the Bouncer's current velocity to its position
  void update() {
    
    location.add(velocity);
    handleBounce();
    
  }

  // handleBounce()
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately

  void handleBounce() {
    // Check the left and right
    if (location.x - size/2 < 0 || location.x + size/2 > width) {
      // Bounce on the x-axis
      velocity.x = velocity.x * -1;
    }

    // Check the top and bottom
    if (location.y - size/2 < 0 || location.y + size/2 > height) {
      // Bounce on the y-axis
      velocity.y = velocity.y * -1;
    }

    // Make sure the Bouncer isn't off the edge
    location.x = constrain(location.x, size/2, width-size/2);
    location.y = constrain(location.y, size/2, height-size/2);
  }
  
  // display()
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(defaultColor);
    ellipse(location.x, location.y, size, size);
    
    if (keyPressed){
      simulate();
      renderTrue();
    }
  }
  
  //rotation
  void simulate(){
    theta+=(keys[0]?0.5:0);
    theta%=TWO_PI;
  }
  
  void renderTrue(){
    velocity.x = 0;
    velocity.y = 0;
    
    translate(location.x,location.y);
    rotate(theta);
  }
  
  
  //if key pressed bouncer will stop moving and rotate on itself
  void keyPressed(){ handleKeys(true); }
  
  //if key released, bouncer will stop rotating and move at given velocity
  void keyReleased(){ handleKeys(false); }
  
  //method to organise the different keys i'll use for the game (only space bar so far)
  void handleKeys(boolean b){
    
    if (b){
      if (key == ' '){
        keys[0] = b;
      }
    }
  }
  
  
  
}