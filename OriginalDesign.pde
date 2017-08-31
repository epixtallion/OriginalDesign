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
  int[] endPoint = hand(6 * minute() + round(second()/10), 64);

  //Set color and thickness of minute hand
  stroke(200, 200, 200);
  strokeWeight(4);

  //Draws minute hand
  line(150, 150, endPoint[0], endPoint[1]);
}
void hours(){
  //Get coordinates for hour hand from hand()
  int degree = 30 * (hour()%12) + round(minute()/2);
  int[] endPoint = hand(degree, 30);

  //Set color and thickness of hour hand
  stroke(0, 0, 0);
  strokeWeight(10);

  //Draws hour hand
  line(150, 150, endPoint[0], endPoint[1]);
}
int[] hand(int angle, int lth){
  //Creates variables and finds coordinates
  int x = round(sin(angle*2*PI/360)*lth) + 150;
  int y = round(cos(angle*2*PI/360)*-lth) + 150;
  //Creates array for coordinates to return
  int[] coords = {x, y};
  return coords;
}
