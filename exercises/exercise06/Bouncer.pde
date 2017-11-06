// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity.

class Bouncer {

  //CHANGED using vectors instead of variables for positions and speeds
  //for more control of the bouncers
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  // The size of the Bouncer
  float size;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float _x, float _y, float _vx, float _vy, float tempSize, color tempDefaultColor) {
    location.x= _x;
    location.y= _y;
    velocity.x= _vx;
    velocity.y= _vy;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
    topspeed = 4;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    
    magnet();

    handleBounce();
  }
  
  //CHANGED funtion that makes a magnetic field for the bouncers at the brightest point
  //magnet()
  
  void magnet(){
    
    //find vector pointing at brightestPixel point
    PVector dir = PVector.sub(brightestPixel,location);
    
    dir.normalize(); //normalize
    dir.mult(0.5); //scale
    acceleration = dir; //set to acceleration
    
    //if(location.x-brightestPixel.x == 60 || location.y-brightestPixel.y == 60){
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
   // } 
  }

  // handleBounce()
  //
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
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(location.x, location.y, size, size);
  }
}