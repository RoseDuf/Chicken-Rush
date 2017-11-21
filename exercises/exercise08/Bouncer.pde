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

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
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
  }
}