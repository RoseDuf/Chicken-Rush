//Exercise 08

//main class for the chicken game prototype using bouncers

//starting with one chicken

//background attributes
color backgroundColor = color(150,200,0); //pink background
PImage grass;

//seed variables
PImage seeds;
int seedSize = 20;
ArrayList <Seeds> multSeeds = new ArrayList(); //number of seeds generated at a time

int INTERVAL = 5000; // = 5 seconds


int INTERVAL2 = 3000; // = 3 seconds
int nextSeed; //speed increases at each level


//chicken attributes for constructor
float speed = 5;

//chicken image
int frame = 2; //how many images
PImage [] img = new PImage[frame];
int n; //counter that starts at 0
int a = 8; //nbr os seeds starts at 2, goes all the way to 10 by decrementing a
final int ANIMATION_SPEED = 170; //= .17 seconds
int firstTime; //When the current image was first displayed
 

Chicken chicken;

 //setup() function
 void setup(){
   size(640,480);
   
   //background setup
   grass = loadImage("grass.png");
   
   //seeds setup
   nextSeed = millis();
   seeds = loadImage("seed.png");
   
   //generate seed
   
   multSeeds.add(new Seeds(seedSize));
   
   //chicken setup
   img[0] = loadImage("chickenw1.png");
   img[1] = loadImage("chickenw2.png");
  
   //attribute timer to first occurence of image
   firstTime = millis();
   
   chicken = new Chicken(100, 380, speed, 40);
 }
 
 //draw() function
 void draw(){
   image(grass,0,0);
   
   
    //seed behaviour
    if (millis() - nextSeed > INTERVAL2){
      if (multSeeds.size() <10){
      multSeeds.add(new Seeds(seedSize));
      }
    nextSeed = millis();
   }
   for (int i=multSeeds.size()-1; i>=0; i--){
   multSeeds.get(i).update();
    multSeeds.get(i).display();
   }
    
   //chicken behaviour
   chicken.update();
   chicken.display(); 
 }
 
 void keyPressed(){ 
  
    chicken.keyPressed();
  }
  
    void keyReleased(){
        chicken.keyReleased();

  }
 

 
 
 
 
 