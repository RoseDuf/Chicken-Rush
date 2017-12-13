// Chicken
//
// A class that defines a chicken that can bounce around on the screen
// at a specific speed and rotates on itself,
// when a key is pressed 

class Chicken {
  
  //varibles to let you choose the initial location and speed of the chicken
  float x;
  float y;
  float speed;

  // The size of the Chicken
  float size;

  // The default fill colour of the Chicken
  color defaultColor;
  
  //varibles for rotate
  float theta = PI/2;
  float defaultSpeed = 0;

  // Chicken(tempX,tempY,tempSpeed,tempSize,tempDefaultColor)
  // Creates a Chicken with the provided values by remembering them.
  Chicken(float _x, float _y, float tempSpeed, float tempSize) {
    x = _x;
    y = _y;
    speed = tempSpeed;
    size = tempSize;
  }
  
  //getters and setters
  float getX(){return x;}
  void setX(float _x){x = _x;}
  
  float getY(){return y;}
  void setY(float _y){y = _y;}
  
  float getSpeed(){return speed;}
  void setSpeed(float _speed){speed = _speed;}
  
  float getDefaultSpeed(){return defaultSpeed;}
  void setDefaultSpeed(float ds){defaultSpeed = ds;}

  // update()
  // Adds the chicken's current velocity to its position
  void update() {
    if(!keyPressed){
    theta += 0.1;
    }
    
    //rotate object
    x += cos(theta +PI/2) * defaultSpeed;
    y += sin(theta +PI/2) * defaultSpeed;
    handleBounce();
    
  }

  // handleBounce()
  // Checks if the chicken is overlapping a side of the window
  // and if so reverses its speed appropriately
  void handleBounce() {
    // Check the left and right
    if (x - size/2 < 0 || x + size/2 > width) {
      // Bounce on the x-axis
      defaultSpeed = defaultSpeed * -1;
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      defaultSpeed = defaultSpeed * -1;
    }

    // Make sure the chicken isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
  
  // display()
  // Draw an ellipse in the Chicken's location, with its size
  // and with its fill
  void display(){
    
    translate(x, y);
    rotate(theta);
    
    //animate chicken
    if (millis() - firstTime >= ANIMATION_SPEED) {
      
    //Increment n, then compute its modulo
    //this will switch from the first image to the second
    n = ++n % img.length;
    firstTime = millis();
    }
    
    //display image
    scale(1,-1); //put image upside down (otherwise chicken goes backwards)
    imageMode(CENTER);
    image(img[n],size,0,size,size);
  }
  
  //if key pressed chicken will stop moving and rotate on itself
  void keyPressed(){ 
    if(keyCode == UP){
     defaultSpeed = speed;
    }
  }
  
  //if key released, chicken will stop rotating and move at given speed
  void keyReleased(){
    if (keyCode == UP){
    defaultSpeed = 0;
    }
  }
 
}