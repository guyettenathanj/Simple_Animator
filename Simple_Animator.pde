import org.gicentre.handy.*;
import java.util.ArrayList;
import java.util.Random;

// Program state...
int rectWidth = 100;
int rectHeight = 100;
int stepLength = 100;
ArrayList<Shape> shapes = new ArrayList<Shape>();
ArrayList<Button> uiElements = new ArrayList<Button>();
Boolean drawbackground = true;
Boolean lineMode;
color backgroundColor = color(0, 0, 0);

void setup()
{
  size(1500, 1000);
  noStroke();
  background(0);
  addShapes(4);
}

void draw() 
{
  drawBackgroundLogic();
  uiLogic(uiElements);
  shapeLogic(shapes);
}

void uiLogic(ArrayList<Button> uiElements)
{
}

void shapeLogic(ArrayList<Shape> shapes)
{
  for(Shape shape: shapes) 
  { 
    mouseHoverLogic(shape);
    fill(shape.currentFillColor);
    shape.display();
  }
}

void addShapes(int numShapes)
{
  for(int i = 0; i < numShapes; i ++)
  {
    shapes.add(
    new Rectangle(
    getRandomNumber(0, 30),getRandomNumber(0, 300) )
    );
  }
}

private boolean mouseHoveringOnShape(Shape r) 
{
  return r.containsPoint(mouseX, mouseY);
}

void keyPressed() 
{
  for(Shape r: shapes)
  {
    r.onKeyPressed(key);
  }
}

void mouseHoverLogic(Shape s)
{
  if(mouseHoveringOnShape(s))
  {
    s.onMouseHover();
  }
  else if(!mouseHoveringOnShape(s)) 
  {
    if(!s.recordingMode)
    {
      s.onMouseOutside();
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
