import org.gicentre.handy.*;

// Program state...
int rectWidth = 100;
int rectHeight = 100;
int stepLength = 100;
HandyRenderer h, h1,h2,h3,h4;
Rectangle r = new Rectangle();
CardinalDirectionMover c = null;
Boolean drawbackground = true;

// Variable to hold current fill color. Default is white.
color currentFillColor = color(255, 255, 255); 
Boolean recordingMode = false;
Boolean lineMode;
   
   
void setup() {
  size(1500, 1000);
  noStroke();
  background(0);
  h1 = HandyPresets.createPencil(this);
  h2 = HandyPresets.createColouredPencil(this);
  h3 = HandyPresets.createWaterAndInk(this);
  h4 = HandyPresets.createMarker(this);
  h = h4;
}


void draw() { 
  if(drawbackground)
  {
    background(0);
  }
  
  h.setRoughness(700);
  fill(currentFillColor);
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
      currentFillColor = color(255, 0, 0); 
    }
    else if(!recordingMode){
      r.setRecordingMode(false);
      currentFillColor = color(255, 255, 255); 
    }
  }
  else if (key == 'b') {
    drawbackground = ! drawbackground;
  }
  else if (key == 'p') {
  }
}
