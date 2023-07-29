import org.gicentre.handy.*;
import java.util.ArrayList;
import java.util.Random;

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
  
  for(int i = 0; i <= 5; i ++)
  {
    rectangles.add(
    new Rectangle(
    getRandomNumber(0, 500),getRandomNumber(0, 500) )
    );
  }
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
  
  for(Rectangle r: rectangles){
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
      r.currentFillColor = color(getRandomNumber(50, 255), getRandomNumber(0,1 ), 0); 
    } else if(!r.recordingMode){
      r.setRecordingMode(false);
      r.currentFillColor = color(getRandomNumber(0, 255), 255, 255); 
    }
  } else if (key == 'b') {
    drawbackground = !drawbackground;
  } else if (key == 'p') {
    // ... handle 'p' key press here
  }
  
  }
}
  
int getRandomNumber(int lowerBound, int upperBound) 
{
  Random random = new Random();
  int number = random.nextInt(lowerBound, upperBound); 
  System.out.println("Number was " + number);
  return number;
}
