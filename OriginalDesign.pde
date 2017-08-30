void setup(){
  size(300,300);
}
void draw(){
  background(135,185,167);
  watch();
}
void watch(){
  //Draws watch strap
  noStroke();
  fill(67,44,19);
  rect(85, 0, 130, 300);
  
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
  int[] endPoint = hand(6 * second(), 70);
  
  //Set color and thickness of second hand
  stroke(255, 28, 28);
  strokeWeight(2);
  
  //Draws second hand
  line(150, 150, endPoint[0], endPoint[1]);
}
void minutes(){
  //Get coordinates for minute hand from hand()
  int[] endPoint = hand(6 * minute(), 64);
  
  //Set color and thickness of minute hand
  stroke(200, 200, 200);
  strokeWeight(4);
  
  //Draws minute hand
  line(150, 150, endPoint[0], endPoint[1]);
}
void hours(){
  //Get coordinates for hour hand from hand()
  int degree = round((30 * (hour()%12)) + (1/2 * minute()));
  int[] endPoint = hand(degree, 30);
  
  //Set color and thickness of hour hand
  stroke(0, 0, 0);
  strokeWeight(10);
  
  //Draws hour hand
  line(150, 150, endPoint[0], endPoint[1]);
}
int[] hand(int angle, int lth){
  //Gets number that can be inputted to sine/cosine function
  int work = (angle <= 90 || angle >= 270) ?
  90 - (angle % 90) : angle % 90;
  
  //Find opposite and adjacent for circle of 1 unit radius
  int opp = round(sin(work*PI/180)*lth);
  int adj = round(cos(work*PI/180)*lth);
  
  //Account for right angle values
  if(angle == 90) {adj = lth; opp = 0;}
  else if(work == 0) {adj = 0; opp = lth; } 
  
  //Figure out x and y coordinates
  int x;
  int y;
  if (angle <= 90){
    x = 150 + adj;
    y = 150 - opp;
  } else if (angle <= 180){
    x = 150 + adj;
    y = 150 + opp;
  } else if (angle <= 270){
    x = 150 - opp;
    y = 150 + adj;
  } else {
    x = 150 - opp;
    y = 150 - adj;
  }
    
  //Creates array for coordinates to return
  int[] coords = {x, y};
  
  return coords;
}