//Exercise 08

//main class for the chicken game prototype using bouncers

//starting with one bouncer

color backgroundColor = color(200,150,150); //pink background

Chicken chicken;

 //setup() function
 void setup(){
   size(640,480);
   chicken = new Chicken(width/2, height/2, 7, 25, color (150,0,0));
 }
 
 //draw() function
 void draw(){
   background(backgroundColor);
   chicken.update();
   chicken.display(); 
 }
 
 
 