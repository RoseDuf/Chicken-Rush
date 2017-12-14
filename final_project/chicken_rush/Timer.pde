//Timer

//timer goes to 60 seconds and then the game ends

class Timer {
  
  int start = 0; 
  int stop = 61000; //= 61 seconds
  boolean running = true;
  
  void startTimer(){
    start = millis();
  }
  
  //this method will return the amount of time elapsed from the start
  int getTimeElapsed(){
    int elapsed;
    if (running) {
      elapsed = (millis() - start); //a positive number
    }
    else {
      elapsed = (stop - start); //61-61 = 0;
    }
    return elapsed;
  }
  
  //number of seconds (61000/1000 = 61)
  int second() {
        return getTimeElapsed()/1000;
  }
  
  void time() {
    //if timer is still running, print seconds
    if (running == true){
      textAlign(CENTER);
      textSize(30);
      text(nf(t.second(), 2), 320, 50);
      
      //once 61 is reached, stop timer
      if (millis() > stop){
        running = false;
      }
    }
    //if running = false, print GAME OVER
    else {
      textAlign(CENTER);
      textSize(30);
      text("GAME OVER", 320, 50);
    }
    
  }
  
  //display time
  void displayTimer() {
    time();
  }
  
  
  
}