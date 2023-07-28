import org.gicentre.handy.*;

// Program state...
int rectWidth = 100;
int rectHeight = 100;
int stepLength = 100;
Rectangle r = new Rectangle();
Boolean drawbackground = true;
Boolean recordingMode = false;
Boolean lineMode;
color backgroundColor = color(0, 0, 0);
   
void setup() {
  size(1500, 1000);
  noStroke();
  background(0);
}


void draw() { 
  if(drawbackground)
  {
    background(backgroundColor);
  }
  
  fill(r.currentFillColor);
  r.display();
}


void keyPressed() {
  if (key == '6') {
    r.moveRight(stepLength);
  }
  else if (key == '4') {
    r.moveLeft(stepLength);
  }
  else if (key == '2') {
    r.moveDown(stepLength);
  }
  else if (key == '8') {
    r.moveUp(stepLength);
  }
else if (key == 'r') {
    recordingMode = ! recordingMode;
    if(recordingMode){
      r.setRecordingMode(true);
      r.playbackPositionHistory(50);
      r.currentFillColor = color(255, 0, 0); 
    }
    else if(!recordingMode){
      r.setRecordingMode(false);
      r.currentFillColor = color(255, 255, 255); 
    }
  }
  else if (key == 'b') {
    drawbackground = ! drawbackground;
  }
  else if (key == 'p') {
  }
}
