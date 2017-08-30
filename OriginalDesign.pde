void setup(){
  size(300,300);
}
void draw(){
  background(67,64,57);
  watch();
}
void watch(){
  //Draws watch strap
  noStroke();
  fill(67,44,19);
  rect(75, 0, 150, 300);
  
  
  //Draws a watch
  fill(234,218,88);
  noStroke();
  ellipse(150,150,200,200);
  
  //Draws watch backing
  fill(56,56,56);
  ellipse(150,150,165,165);
  
  fill(216,216,216);
  rect(147,80,6,20);
  
  //Gets seconds, minutes, and time from Calendar, passes on to seconds,
  //minutes, and hours functions
  hours();
  minutes();
  seconds();
  
  //Draws center dot for hands
  fill(15,15,15);
  ellipse(150,150,8,8);
}
void seconds(){
  //Get coordinates for second hand from hand()
  float[] endPoint = hand(6 * second(), 70);
  
  //Set color and thickness of second hand
  stroke(255, 28, 28);
  strokeWeight(2);
  
  //Draws second hand
  line(150, 150, endPoint[0], endPoint[1]);
}
void minutes(){
  //Draws minute hand
}
void hours(){
  //Draws hour hand
}
float[] hand(int angle, float lth){
  //Gets number that can be inputted to sine/cosine function
  int work = (angle <= 90 || angle >= 270) ?
  90 - (angle % 90) : angle % 90;
  
  //Find opposite and adjacent for circle of 1 unit radius
  double opp = sin(work*PI/180)*lth;
  double adj = cos(work*PI/180)*lth;
  
  //Account for right angle values
  if(angle == 90) {adj = lth; opp = 0;}
  else if(work == 0) {adj = 0; opp = lth; } 
  
  //Figure out x and y coordinates
  float x;
  float y;
  if (angle <= 90){
    x = 150 + parseFloat(String.valueOf(adj));
    y = 150 - parseFloat(String.valueOf(opp));
  } else if (angle <= 180){
    x = 150 + parseFloat(String.valueOf(adj));
    y = 150 + parseFloat(String.valueOf(opp));
  } else if (angle <= 270){
    x = 150 - parseFloat(String.valueOf(opp));
    y = 150 + parseFloat(String.valueOf(adj));
  } else {
    x = 150 - parseFloat(String.valueOf(opp));
    y = 150 - parseFloat(String.valueOf(adj));
  }
    
  //Creates array for coordinates to return
  float[] coords = {x, y};
  
  return coords;
}