//Exercise 08

//main class for the chicken game prototype using bouncers


//sound
//import processing.sound.*;
//SoundFile ding;

//background attributes
color backgroundColor = color(150,200,0); //pink background
PImage grass;

//seed variables
PImage seeds;
int seedSize = 20;
ArrayList <Seeds> multSeeds = new ArrayList(); //number of seeds generated at a time

int INTERVAL = 6500; // = 6.5 seconds interval for deletion of seed
float interval2 = 5000; // = 5 seconds intervel for creation of seed
int INTERVAL3 = 10000; // = 10 second interval for increase generation of seed

int nextSeed; //speed increases at each level
int newSpeed; //generation speed

//chicken attributes for constructor
float speed = 5;

//chicken image
int frame = 2; //how many images
PImage [] img = new PImage[frame];
PImage [] img2 = new PImage[frame];

int n; //counter that starts at 0
final int ANIMATION_SPEED = 170; //= .17 seconds
int firstTime; //When the current image was first displayed
 
Chicken chicken1;
Chicken chicken2;

//counter variables
int counter1 = 0;
int counter2 = 0;

//timer variables
Timer t;

 //setup() function
 void setup(){
   size(640,480);
   
   //sound setup
   //ding = new SoundFile(this, "ding.wav");
   
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
   img2[0] = loadImage("chicken1.png");
   img2[1] = loadImage("chicken2.png");
  
   //attribute timer to first occurence of image
   firstTime = millis();
   
   chicken1 = new Chicken(100, 380, speed, 40, img);
   chicken2 = new Chicken(540, 380, speed, 40, img2);
   
   //timer setup
   t = new Timer();
   t.startTimer();
 }
 
 //draw() function
 void draw(){
   //background
   image(grass,0,0);
   
    //seed behaviour
    
   if (millis() - nextSeed > interval2){
     if (multSeeds.size() <100){
       multSeeds.add(new Seeds(seedSize));
     }
     if (millis() - newSpeed > INTERVAL3){
       newSpeed = millis();
       interval2 = interval2/(1.5);
     }
   nextSeed = millis();
   }

   //go through arrayList to display and update
   for (int i=0; i<=multSeeds.size()-1; i++){
     multSeeds.get(i).update();
     multSeeds.get(i).display();
   }
    
   //chicken behaviour
   chicken1.update();
   chicken1.display(); 
   chicken2.update();
   chicken2.display();
   
   //collision
   for (int i=0; i<=multSeeds.size()-1; i++){
     if ((chicken1.collidesWith(multSeeds.get(i)))||(chicken2.collidesWith(multSeeds.get(i)))){
       print("seed eaten ");
       //ding.play();
       multSeeds.get(i).showSeed = false;
     }
   }
   
   //collision counter
   for (int i=0; i<=multSeeds.size()-1; i++){
     if ((chicken1.collidesWith(multSeeds.get(i)) == true) &&
         (t.running == true)/*&&(multSeeds.get(i).showSeed)*/){
       counter1 += 1; //why does this increment so much?!
     }
   }
   textAlign(CENTER);
   textSize(30);
   text(counter1, 100, 50);
   
   //collision counter
   for (int i=0; i<=multSeeds.size()-1; i++){
     if ((chicken2.collidesWith(multSeeds.get(i)) == true) &&
         (t.running == true)/*&&(multSeeds.get(i).showSeed)*/){
       counter2 = counter2 + 1; //why does this increment so much?!
     }
   }
   textAlign(CENTER);
   textSize(30);
   text(counter2, 540, 50);
  
   
   //timer behaviour
   t.displayTimer();
 }
 
 //if key pressed chicken will stop moving and rotate on itself
 void keyPressed(){ 
    if(keyCode == SHIFT){
       chicken1.keyPressed();
    }
    else if(keyCode == UP){
       chicken2.keyPressed();
    }
  }
  
  //if key released, chicken will stop rotating and move at given speed
  void keyReleased(){
    if(keyCode == SHIFT){
       chicken1.keyReleased();
    }
    else if(keyCode == UP){
       chicken2.keyReleased();
    }

  }
 

 
 
 
 
 