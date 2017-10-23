//new Creature

//A class defining the behaviour of a single Creature

class Creature {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int collideEnergy = 10;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energyC;
  
  //CHANGED 3 filling integers to allow the color to change
  int fill1 = 0;
  int fill2 = 255;
  int fill3 = 0;

  //Creature constructor
  Creature(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energyC = maxEnergy;
  }

  //CHANGED code is essentially the same as the griddie code for update()
  void update() {
    
    if (energyC == 0) { //code breaks out of update(), skipping the line statement below
      return;
    }
    
    int xMoveType = floor(random(-1,2)); 
    int yMoveType = floor(random(-1,2));
    
    x += size * xMoveType;
    y += size * yMoveType;
    
    
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }
 
    energyC = constrain(energyC,0,maxEnergy);
  }
  
  void collide(Griddie other) {
    
    if (energyC == 0) {
      return; // ...break out of collide(), skipping the line statement below
    }
    
    //CHANGED checks if creature collides with the griddies (at all position of x and y within the griddie)
    if ((x == other.x && y == other.y)||(x == other.x + other.size && y == other.y) 
              ||(x == other.x + other.size && y == other.y - other.size)
              ||(x == other.x && y == other.y - other.size)){
      
      //if there is collision, the griddie will get nourrished and will go from red to blue
      //(more blue = more nourrished)
      other.fill1 -= collideEnergy;
      other.fill3 += collideEnergy;
      
      //the creatures will lose energy (get weaker) and will lose their color the more they are eaten
      //until they die 
      fill2 -=10;
      energyC -= 15;
      
      energyC = constrain(energyC,0,maxEnergy);
    }
  }

  //displays creatures
  void display() {
    
    fill(fill1,fill2,fill3, energyC); 
    noStroke();
    rect(x, y, size, size);
  }
}