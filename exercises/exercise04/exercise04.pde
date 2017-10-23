// Griddies
// by Pippin Barr
// MODIFIED BY: Rose Dufresne
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];

//CHANGED create Creature array
Creature[] creature = new Creature[100];

// setup()
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  //the for loop iterates through the length of the array (100) to add a new griddie object 
  //at a random position x and y 
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize)); //position x at random number between 0 to 320
    int y = floor(random(0, height/gridSize)); //position y at random number between 0 to 240
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize); //*20 so that the squares are
    //always 20 pixels appart from eachother
  }
   for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/10)); //position x at random number between 0 to 320
    int y = floor(random(0, height/10));
    creature[i] = new Creature(x * gridSize, y * gridSize, 10);
   }
}

// draw()
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();
    
    //CHANGED update creatures
    creature[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      //for every increase of one i, the for loop with iterate through the entire length of the
      //array with the variable j. So, if j is not equal to i (which is every j through the loop except of the 
      //the j equal to i, something will happen
      if (j != i) {
        // QUESTION: What does this line check?
        //apply the conditions from the method "collide" to all squares that aren't the square i
        griddies[i].collide(griddies[j]);
        
        //CHANGED behaviour when creature collides with griddies
        creature[i].collide(griddies[j]);
      }
      
    griddies[i].display();
    
    //CHANGED display creatures
    creature[i].display();
  
    }
  }
}