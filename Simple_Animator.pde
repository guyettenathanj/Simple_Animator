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

void setup()
{
  size(1500, 1000);
  noStroke();
  background(0);
  
  for(int i = 0; i <= 2; i ++)
  {
    rectangles.add(
    new Rectangle(
    getRandomNumber(0, 30),getRandomNumber(0, 300) )
    );
  }
}

private boolean mouseHoveringOnShape(Rectangle r) 
{
  return r.containsPoint(mouseX, mouseY);
}

void draw() 
{
  drawBackgroundLogic();
  shapeLogic(rectangles);
}

void shapeLogic(ArrayList<Rectangle> rectangles)
{
  for(Rectangle shape: rectangles) 
  { 
    mouseHoverLogic(shape);
    fill(shape.currentFillColor);
    shape.display();
  }
}

void keyPressed() 
{
  for(Rectangle r: rectangles)
  {
    r.onKeyPressed(key);
  }
}

void mouseHoverLogic(Rectangle r)
{
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
}

void drawBackgroundLogic()
{
  if(drawbackground) 
  {
    background(backgroundColor);
  }
}
  
int getRandomNumber(int lowerBound, int upperBound) 
{
  Random random = new Random();
  int number = random.nextInt(lowerBound, upperBound); 
  System.out.println("Number was " + number);
  return number;
}
