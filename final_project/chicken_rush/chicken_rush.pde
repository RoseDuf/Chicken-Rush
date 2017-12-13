//Exercise 08

//main class for the chicken game prototype using bouncers

//starting with one chicken

color backgroundColor = color(150,200,0); //pink background

//chicken attributes for constructor
float speed = 5;

//chicken image
int frame = 2; //how many images
PImage [] img = new PImage[frame];
int n; //counter that starts at 0
final int ANIMATION_SPEED = 170; //= .17 seconds
int firstTime; //When the current image was first displayed
 

Chicken chicken;

 //setup() function
 void setup(){
   
   img[0] = loadImage("chicken1.png");
   img[1] = loadImage("chicken2.png");
   
   firstTime = millis();
   
   size(640,480);
   chicken = new Chicken(width/2, height/2, speed, 40);
 }
 
 //draw() function
 void draw(){
   background(backgroundColor);
   chicken.update();
   chicken.display(); 
 }
 
 
 
 
 