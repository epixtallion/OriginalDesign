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
  //Draws second hand
}
void minutes(){
  //Draws minute hand
}
void hours(){
  //Draws hour hand
}
int[] hand(int angle, int lth){
  //Gets number that can be inputted to sine/cosine function
  int work = 90 - (angle % 90);
  
  //Find opposite and adjacent for circle of 1 unit radius
  int opp = (int) Math.round(Math.sin(work));
  int adj = (int) Math.round(Math.cos(work));
  
  //Figure out x and y coordinates
  int x = (angle+work)/90 < 3
    ? 150 + lth*adj : 150 - lth*adj;
  int y = (angle+work)/90 == 1 || (angle+work)/90 == 4
    ? 150 + lth*opp : 150 - lth*opp;
    
  //Creates array for coordinates to return
  int[] coords = {x, y};
  
  return coords;
}