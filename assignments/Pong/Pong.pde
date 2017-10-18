// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.

float r1 = random(0,255);
float r2 = random(0,255);
float r3 = random(0,255);

float xline;
float yline;
//CHANGED Variables for fireworks when player wins
int NUM = 40;
PVector[] position;
PVector[] velocity;
int[] ttl;

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Score p1;
Score p2;

//CHANGED Variables for counter
String num1 = "0";
String num2 = "0";
color p1color = color(255,99,71);
color p2color = color(65,105,225);

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);


// setup()
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

    //CHANGED added setup for fireworks when player wins
    position = new PVector[NUM];
    velocity = new PVector[NUM];
    ttl = new int[NUM];
    for( int i = 0; i < NUM; i++) {
        position[i] = new PVector(0,0);
        if (i < NUM/2) {
            velocity[i] = new PVector(random(-2,2), random(-10,-5));
            ttl[i] = int(random(50,100));
        } else {
            velocity[i] = new PVector(0,0);
            ttl[i] = int(random(0,50));
        }
    }

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q',p1color);
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p',p2color);

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  //CHANGED added two scoring objects, one red and one blue
  p1 = new Score(num1,309,223, p1color); 
  p2 = new Score(num2,309,280, p2color);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);
  
  //CHANGED added a retro green gridded lines in the back ground
  //lines on x axis
  for(int i=1; i<=20;i++){ //number of lines that are drawn (20)
  float ran1 = random(1,100); 
  stroke(0,100,0); //green
  line(xline,0,xline,height); //draw line
  xline=xline+ran1; //change position of line in x at random speed
  
    if(xline>width){ //when line reaches edges, it resets
    xline=0;
    }
  }
  
  //lines on y axis
  for(int i=1; i<=20;i++){ //number on lines that are drawn (20)
  float ran1 = random(1,100);
  stroke(0,100,0); //green
  line(0,yline,width,yline); //draw line
  yline=yline+ran1; //change position of line in y at random speed
  
    if(yline>height){ //when line reaches edge, it resets
    yline=0;
    }
  }

  //CHANGED added fireworks to celebrate the player's win
  if(num1 == "WINNER" || num2 == "WINNER"){
    for( int i = 0; i < NUM; i++) {
      stroke(255,255,0);
      strokeWeight(2);
      point(position[i].x + 225, position[i].y + height-100);
      point(position[i].x + width/2, position[i].y + height);
      point(position[i].x + 415, position[i].y + height-100);
    }

    for( int i = 0; i < NUM; i++) {
        position[i].add(velocity[i]);
        ttl[i]--;
        if (ttl[i] < 0) {
        
            velocity[i] = new PVector(random(-2,2), random(-10,-5));
            position[i] = new PVector(0,0);
            ttl[i] = int(random(50,100));
        }
     }
  }
  
  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  
  //CHANGED if ball reaches right side of screen, a point for
  //player 1 is given
  if(ball.isOffScreenRight()){
    p1.setNum(num1);
    int temp;
    temp = Integer.parseInt(p1.getNum())+1; //increment score by 1
    num1 = Integer.toString(temp);
    
      if (temp == 11){ //CHANGED if player 1 gets 10 points, he/she wins
       num1 = "WINNER"; //change text to show winner
       p1.setNum(num1);
       p1.getNum();
       p1.setX(258); //reposition text to center
       p1.getX();
       ball.stop(); //game ends so ball stops moving
     }
  }
 
  //CHANGED if ball reaches left side of screen, a point for
  //player 2 is given
  if(ball.isOffScreenLeft()){
    p2.setNum(num2);
    int temp;
    temp = Integer.parseInt(p2.getNum())+1; //increment score by 1
    num2 = Integer.toString(temp);
    
     if (temp == 11){ //CHANGED if player 2 gets 10 points, he/she wins
       num2 = "WINNER"; //change text to show winner
       p2.setNum(num2);
       p2.getNum();
       p2.setX(258); //reposition text to center
       p2.getX();
       ball.stop(); //game ends, so ball stops moving
    }
  }
  
  //CHANGED Display message saying game has ended 
  if (num1 == "WINNER" || num2 == "WINNER"){
     textSize(35);
     fill(255);
     text("GAME OVER",225,50);
  }
  
  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreenRight()||ball.isOffScreenLeft()) {
    // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  
  //CHANGED display scores
  p1.display();
  p2.display();
  
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}