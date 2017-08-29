void setup(){
  size(300,300);
}
void draw(){
  background(67,64,57);
  watch();
}
void watch(){
  //Draws watch strap
  fill(67,44,19);
  
  
  //Draws a watch
  fill(234,218,88);
  noStroke();
  ellipse(150,150,200,200);
  //Gets seconds, minutes, and time from Calendar, passes on to seconds,
  //minutes, and hours functions
}
void seconds(){
  //Draws second hand
}
void minutes(){
  //Draws minute hand
}
void hours(){
  //Draws hour hand
}