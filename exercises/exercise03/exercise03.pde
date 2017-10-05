//This function give us two semi transparent circles of red and blue colours that
//bounce on the sides of the window and when they cross eachother's paths, they switch colours

color backgroundColor = color(200,150,150); //pink background

//Two bouncer objects
Bouncer bouncer;
Bouncer bouncer2;

//setup() function
void setup() {
  size(640,480);
  background(backgroundColor);
  //creating two new bouncer objects
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//draw() function
void draw() {
  bouncer.update(); //calling update() function for bouncer 1
  bouncer2.update(); //calling update() function for bouncer 2
  bouncer.draw(); //draw the 2 balls
  bouncer2.draw();
}