//Exercise 08

//main class for the chicken game prototype using bouncers

//starting with one bouncer

color backgroundColor = color(200,150,150); //pink background

Bouncer bouncer;

 //setup() function
 void setup(){
   size(640,480);
   bouncer = new Bouncer(width/2, height/2, 2, 2, 50, color (150,0,0));
 }
 
 //draw() function
 void draw(){
   background(backgroundColor);
   bouncer.update();
   bouncer.display(); 
 }
 
 
 