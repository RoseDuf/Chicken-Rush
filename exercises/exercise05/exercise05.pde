//exercise05

//producing columns of rectangles of different colours
//using the noise function

float[] arrcol;

//setup
void setup(){
  background(20);
  size(640, 480);
  
  //create a range of colors for the rectangles
  arrcol = new float[32];
  
  for(int i=0; i<arrcol.length; i++){
    arrcol[i] = 0+i*255/arrcol.length; //255/32 colors
  }
  
}

//variable for noise function
float xoff = 0.00;

//the draw function
void draw() {
  background(20);
  //noise
  xoff = xoff + .03;
  float n = noise(xoff) * width;
  
  //white edges for each rectangle
  stroke(255);
  
  //creating rectangles
  for (int i=0; i < n; i=20+i){
    
    //fill in the rectangles using the array of colors
    fill(120, 0 ,arrcol[floor(i/20)]);
    
    rect(i, 0, 20, height);
    
      }
    
  
}