//exercise05

//producing columns of rectangles of different colours
//using the noise function

//setup
void setup(){
  background(20);
  size(640, 480);
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
    
    float col = 100;
    if (i>=20){
      fill(col+20,0,0);
    }
    if (i>=40){
      fill(col+20,0,0);
    }
    if (i>=60){
      fill(col+20,0,0);
    }
    rect(i, 0, 20, height);
    
      }
    
  
}