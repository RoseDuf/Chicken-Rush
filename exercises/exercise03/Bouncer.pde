 class Bouncer {
  
 //initialize variables
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 //initializing Bouncer object 
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX; //positions in x and y
   y = tempY;
   vx = tempVX; //speeds in x and y
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor; //colouring in the bouncer
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 //creating new function update()
 void update() {
   x += vx; //give movement to ball in x and y
   y += vy;
   
   handleBounce(); //calling handleBounce()
   handleMouse(); //calling handleMouse()
 }
 
 //creating new function handleBounce()
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) { 
    vx = -vx; //if ball's touches a wall, it will move at negative speed in x
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy; //if ball's touches a wall, it will move at negative speed in y
   }
   
   x = constrain(x,size/2,width-size/2); //constrain the boundarys of the position in x
   y = constrain(y,size/2,height-size/2); //and y to make the edges of the ball the limits
 }
 
 //creating new function handleMouse()
 //if mouse is withing the edges of the ball, it will change colour
 void handleMouse() { 
   if (dist(mouseX,mouseY,x,y) < size/2) { 
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor; //once the mouse is out of the boudaries of the ball, 
                               //the colour will go back to default
   }
 }
 
 //draw() function
 //draw the ball
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}