import org.gicentre.handy.*;
import java.util.ArrayList;

// Program state...
int rectWidth = 100;
int rectHeight = 100;
int stepLength = 100;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
Boolean drawbackground = true;

Boolean lineMode;
color backgroundColor = color(0, 0, 0);

void setup() {
  size(1500, 1000);
  noStroke();
  background(0);
  
  // Add rectangles to the list
  rectangles.add(new Rectangle());
  rectangles.add(new Rectangle(200, 300));
}


private boolean mouseHoveringOnShape(Rectangle r) {
  return r.containsPoint(mouseX, mouseY);
}

void draw() {
  if(drawbackground) {
    background(backgroundColor);
  }

  for(Rectangle r: rectangles) {
    if(mouseHoveringOnShape(r)) {
      r.onMouseHover();
    } else if(!mouseHoveringOnShape(r)) {
      if(!r.recordingMode) {
        r.onMouseOutside();
      }
    }

    fill(r.currentFillColor);
    r.display();
  }
}


void keyPressed() {
  // Get the first rectangle from the list for the key presses
  Rectangle r = rectangles.get(0);
  
  if (key == '6') {
    r.moveRight(stepLength);
  } else if (key == '4') {
    r.moveLeft(stepLength);
  } else if (key == '2') {
    r.moveDown(stepLength);
  } else if (key == '8') {
    r.moveUp(stepLength);
  } else if (key == 'r') {
    r.recordingMode = !r.recordingMode;
    if(r.recordingMode){
      r.setRecordingMode(true);
      r.playbackPositionHistory(50);
      r.currentFillColor = color(255, 0, 0); 
    } else if(!r.recordingMode){
      r.setRecordingMode(false);
      r.currentFillColor = color(255, 255, 255); 
    }
  } else if (key == 'b') {
    drawbackground = !drawbackground;
  } else if (key == 'p') {
    // ... handle 'p' key press here
  }
}
