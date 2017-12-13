//Timer

//timer goes to 60 seconds and then the game ends

class Timer {
  
  int start = 0;
  int stop = 61000;
  boolean running = true;
  
  void startTimer(){
    start = millis();
  }
  
  int getTimeElapsed(){
    int elapsed;
    if (running) {
      elapsed = (millis() - start);
    }
    else {
      elapsed = (stop - start);
    }
    return elapsed;
  }
  
  int second() {
        return getTimeElapsed()/1000;
  }
  
  void time() {
    if (running == true){
      textAlign(CENTER);
      textSize(30);
      text(nf(t.second(), 2), 320, 50);
      
      if (millis() > stop){
        running = false;
      }
    }
    else {
      textAlign(CENTER);
      textSize(30);
      text("GAME OVER", 320, 50);
    }
    
  }
  
  void displayTimer() {
    time();
  }
  
  
  
}