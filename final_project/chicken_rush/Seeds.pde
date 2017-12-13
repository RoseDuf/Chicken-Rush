//Randomly generated seeds

//normal seeds give 1 point 
//gold seeds give 2*points for 7 seconds
//red seeds give increased speed for 7 seconds
//radioactive green seeds make player 3 times bigger for 5 seconds

class Seeds{
  
  int timeSeed;
  boolean showSeed = true;
  
  //location variables
  float x = random(0,640);
  float y = random(0,480);
  int size;
  //speed of seed generation
  float generateSpeed;
  
  //constructor
  Seeds (int tempSize){
    size = tempSize;
    timeSeed = millis() + INTERVAL;
  }
  
  //every given number of seconds, a seed will be generated at a new random location
  void update(){
    if (millis() > timeSeed){
      showSeed = false;
    }
    
    // Make sure the seed isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
  
  //diplay the seed
  void display(){
    if (showSeed){
    imageMode(CENTER);
    image(seeds,x,y,20,20);
    }
  }
  
  
  
  
  
  
}