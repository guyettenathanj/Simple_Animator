import org.gicentre.handy.*;

// Program state...
int rectWidth = 100;
int rectHeight = 100;
int stepLength = 100;
Rectangle r = new Rectangle();
Boolean drawbackground = true;

Boolean lineMode;
color backgroundColor = color(0, 0, 0);
   
void setup() {
  size(1500, 1000);
  noStroke();
  background(0);
}


private boolean mouseHoveringOnShape(Rectangle r) {
  return r.containsPoint(mouseX, mouseY);
}

void draw() {
  if(drawbackground) {
    background(backgroundColor);
  }

  if(mouseHoveringOnShape(r)) 
  {
    r.onMouseHover();
  }
  else if(!mouseHoveringOnShape(r))
  {
    if(!r.recordingMode)
    {
      r.onMouseOutside();
    }
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
    r.recordingMode = ! r.recordingMode;
    if(r.recordingMode){
      r.setRecordingMode(true);
      r.playbackPositionHistory(50);
      r.currentFillColor = color(255, 0, 0); 
    }
    else if(!r.recordingMode){
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
