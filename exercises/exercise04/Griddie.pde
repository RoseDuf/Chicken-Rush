// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  //CHANGED 3 filling integers to allow the color to change
  int fill1 = 255;
  int fill2 = 0;
  int fill3 = 0;

  // Griddie(tempX, tempY, tempSize)
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  // Move the Griddie and update its energy levels
  void update() {
    
    // QUESTION: What is this if-statement for?
    //if the the square has no more energy, it dies...
    if (energy == 0) { //code breaks out of update(), skipping the line statement below
      return;
    }
    
    // QUESTION: How does the Griddie movement updating work?
    //creates 2 integer variables that vary randomly from -1 to 2 (floor calculates
    //the closest int value that is less than or equal to the value of the parameter). 
    int xMoveType = floor(random(-1,2)); 
    int yMoveType = floor(random(-1,2));
    //the squares move a whole "size" of itself (or 2) away from its initial point
    //in the x and y positions (can move left one "size" away, right 2 "sizes" away,
    //up one "size" away and down 2 sizes away.
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
    //if a square is before the left edge of the window (x<0), it will reposition
    //to somewhere within the window by adding the integer for the width from x
    if (x < 0) {
      x += width;
    }
    //is square is after the right edge of the window (x>width),it will reposition
    //to somewhere within the window by subtracting the integer for the width from x
    else if (x >= width) {
      x -= width;
    }
    //if a square is over the top edge of the window (y<0), it will reposition
    //to somewhere within the window by adding the integer for the height from y
    if (y < 0) {
      y += height;
    }
    //if a square is over the bottom edge of the window (y<height), it will reposition
    //to somewhere within the window by subtracting the integer for the height from y
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?
    //if energy of the square is zero (black) or the colliding object has energy 
    //equal to zero, the code will...
    if (energy == 0 || other.energy == 0) {
      return; // ...break out of collide(), skipping the line statement below
    }
    
    // QUESTION: What does this if-statement check?
    //if the position of a square is the same as a colliding one in x and y
    //the color or the square will become redder (brighter/more opaque) by a factor of 10
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }



  // display()
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    //the color of the square is (255,0,0) and its opacity is determined by
    //the varible "energy"'s behaviour within the code. Essentially, the opacity 
    //will decrease if a square doesn't collide with another. 
    fill(fill1,fill2,fill3, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}