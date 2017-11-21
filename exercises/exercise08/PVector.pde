class PVector {
 
  float x;
  float y;
 
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
 
 // A function to add another PVector to this PVector. 
 // Simply add the x components and the y components together.

  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
  }

}