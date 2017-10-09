class Bouncer {
 //initialize variables
 float x;
 float y;
 float vx; //CHANGED vx to float
 float vy; //and vx
 float size;
 float randomvx; //CHANGED added new variable for random speed in x 
 float randomvy; //and in y
 float randomsize; //CHANGED added new variable for random size 
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 //initializing Bouncer object 
 Bouncer(int tempX, int tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor, color tempHoverColor) {
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
   mouseClicked(); //CHANGED calling mouseClicked()
 }
 
 //creating new function handleBounce()
 void handleBounce() {
   //CHANGED when the ball hits the wall it will move at a random speed x
   if (x - size/2 < 0 || x + size/2 > width) { 
     randomvx = random(2,10);
     if(vx < 0){
       vx = randomvx;
     }
     else {
       vx = -randomvx;
     }
   //if ball's touches a wall, it will move at negative speed in x
   }
   
   //CHANGED when the ball hits the wall it will move at a random speed in y
   if (y - size/2 < 0 || y + size/2 > height) {
     randomvy = random(2,10);
     if(vy < 0){
       vy = randomvy;
     }
     else {
       vy = -randomvy;
     }
   //if ball's touches a wall, it will move at negative speed in y
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
 //CHANGED created a mouseClicked() function tha will make the  bouncer go faster
 void mouseClicked(){
   if (dist(mouseX,mouseY,x,y) < size/2) { 
     if(mousePressed){
       if(size>=50){
          vx = 2*vx;
          vy = 2*vx;
       } 
     }
    }
  }
}
 