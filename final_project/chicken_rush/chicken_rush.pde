//Exercise 08

//Artist's statement
//What is creative and interesting about this game?
//One of the most challenging parts of this assignment was being able to make a conventient 
//generation pattern for the seeds. In fact, I wanted to be able to have full control on
//the speed each and every seed would get created. In doing so, I had to work a lot with 
//time functions like millis() to make the disapearance and the appearance of seeds independant
//from eachother and to even increase the speed at which seeds will be created (which in turn
//will cause more seeds to appear on the screen at once). I also used millis() for the timer function
//and the animation of the chickens that make them run and flap their wings. Another creative
//aspect of this game is the use of rotations and taking advantage of it to make a challenge to the
//game. Of course, if i'd had more time I would've added more challenges, but having the core mechanic
//of a game be challenging on its own is of basic importance. I think my game is interesting because
//it is a very basic structure that allows implementation of many many things to make it more fun.
//I could add seeds that have special effects of the chickens, I can have enemies attacking the chickens
//or taking away the seeds. I can add items that make the chickens move differently or have
//different sizes. I trully wish I had the time to expand into the vast amount of things that
//I can add to the game and will probably do just that in the future. This game is two players
//for now, but of course I can very easily make it a three or four player game. There can 
//even be a single player mode to get records! This was the first project I did where I used mt own drawings
//to represent each object. I specifically used this type of rotation because it seemed more natural 
//for chickens running. Overall, I think the simplicity of the game makes it unique, creative and,
//of course, full of potential.

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
 

 
 
 
 
 