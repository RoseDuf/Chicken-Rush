//Score
//
//A class that defines a Score board which will add points to either of the players (sides) 
//depending on the the number of number of goals they do to the opponent.

class Score{
  
  /////////////// Properties ///////////////
  
  //variables for the text
  int num;
  float x;
  float y;
  int point = 10;
  
  color player_color;
  
  //Score constructor 
  Score(int _num, float _x, float _y, color c){
    num = _num;
    x = _x;
    y = _y;
    player_color = c;
  }
  
  //Score Mutators (getter and setter for number displayed)
  int getNum(){
    return num;
  }
  void setNum(int n){
    num = n;
  }
  
  //Display function
  void display(){
   fill(player_color);
   textSize(35);
   text(num,x,y);
  }
}