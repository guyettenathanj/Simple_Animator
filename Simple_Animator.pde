import org.gicentre.handy.*;

// Program state...
// Adding random comment.
int rectWidth = 100;
int rectHeight = 100;
int stepLength = 100;
HandyRenderer h, h1,h2,h3,h4;
Rectangle r = new Rectangle();
CardinalDirectionMover c = null;
Boolean drawbackground = true;

// Variable to hold current fill color. Default is white.
color currentFillColor = color(255, 255, 255); 
Boolean selectionMode = false;
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
  if (key == 'd') {
    r.moveRight(stepLength);
  }
  else if (key == 'a') {
    r.moveLeft(stepLength);
  }
  else if (key == 's') {
    r.moveDown(stepLength);
  }
  else if (key == 'w') {
    r.moveUp(stepLength);
  }
else if (key == 'r') {
    selectionMode = ! selectionMode;
    if(selectionMode){
      currentFillColor = color(0, 0, 255); 
    }
    else if(!selectionMode){
      currentFillColor = color(255, 255, 255); 
    }
  }
  else if (key == 'b') {
    drawbackground = ! drawbackground;
  }
}
