//This function give us two semi transparent circles of red and blue colours that
//bounce on the sides of the window and when they cross eachother's paths, they switch colours
float randomNumber1; //CHANGED added 3 new random numbers to be able to modify
float randomNumber2; //the background colour everytime you click your mouse
float randomNumber3;
float rhoverColour1; //CHANGED added 3 random variables to make new colours
float rhoverColour2;
float rhoverColour3;
float randomspeedx; //CHANGED added new varibles for random speeds
float randomspeedy;
color backgroundColor = color(200,150,150); //pink background
float randomsize;

//Two bouncer objects
ArrayList<Bouncer> bouncer3 = new ArrayList();
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
  
  //CHANGED adding a new bouncer whenever mouse is pressed
   for (int i = bouncer3.size()-1; i >= 0; i--) { 
    Bouncer ball = bouncer3.get(i);
    ball.update();
    ball.draw();
   }
}

//CHANGED Adding a method mousePressed() to create a new bouncer whenever mouse is clicked
   void mousePressed(){
   randomspeedx = random(-2,2); //new balls travel in different random directions
   randomspeedy = random(-2,2);
   randomsize = random(20,80); //new balls are of random sizes
   randomNumber1 = random(255); //random colour numbers
   randomNumber2 = random(255);
   randomNumber3 = random(255);
   rhoverColour1 = random(255); //random hover colour numbers
   rhoverColour2 = random(255);
   rhoverColour3 = random(255);
   
   bouncer3.add(new Bouncer(mouseX,mouseY,randomspeedx,randomspeedy,randomsize,color(randomNumber1,randomNumber2,randomNumber3,50),color(rhoverColour1,rhoverColour2,rhoverColour3,50)));
}
 