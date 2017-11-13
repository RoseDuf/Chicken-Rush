// Exercise 06
//
// Play with sound generation and/or sound input.

//From exercise 05:
//producing columns of rectangles of different colours
//using the noise function.

//Modifying by:
//the more rectangles there are, the louder a noise is
//the volume can be controlled by the position of the mouse on the window

import processing.sound.*;


//int prevRect = -1;
float[] arrcol;
SoundFile [] note;

//setup
void setup() {
  background(20);
  size(640, 480);

  //giving tone a sound file
  //2 variables in file name that changes
  int firstnum = 39177;
  int endnum = 30;
  note  = new SoundFile [31];

  //load every single piano note in the array using a for loop
  for (int i = 0; i< note.length; i++) {
    String filename = "sounds/" + firstnum + "__jobro__piano-ff-0" +endnum + ".wav";
    println(i + ": " + filename);
  
    note[i] = new SoundFile(this, filename);
    firstnum++;
    endnum++;
  }

  //create a range of colors for the rectangles
  arrcol = new float[32];

  for (int i=0; i<arrcol.length; i++) {
    arrcol[i] = 0+i*255/arrcol.length; //255/32 colors
  }
}

//variable for noise function
float xoff = 0.0;

//the draw function
void draw() {
  background(20);
  //noise
  xoff = xoff + .02;
  int n = (int) (noise(xoff) * mouseX *1.1);
 // n = constrain(n, 0, width/20);

  //white edges for each rectangle
  stroke(255);

  //creating rectangles
  for (int i=0; i < n; i=20+i) {

    //fill in the rectangles using the array of colors
    fill(120, 0, arrcol[floor(i/20)]);

    rect(i, 0, 20, height);

    
  }

  prevRect = n;
}

//test to see if note works
void keyPressed(){
note[20].play();
}