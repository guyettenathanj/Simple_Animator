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
  addRandomLines(200);
  addRandomRectangles(4);
}

void draw() 
{
  drawBackgroundLogic();
  uiLogic(uiElements);
  shapeLogic(shapes);
  
  stroke(255, 0, 0);  
  line(50, 50, 250, 250);  
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

void uiLogic(ArrayList<Button> uiElements)
{
}

void addRandomRectangles(int numShapes)
{
  for(int i = 0; i < numShapes; i ++)
  {
    shapes.add(
    new Rectangle(
    getRandomNumber(0, 30),getRandomNumber(0, 300) )
    );
  }
}

void addRandomLines(int numLines)
{
  for(int i = 0; i < numLines; i ++)
  {
    shapes.add(
    new Line(
    getRandomCoordinate(0, 300),getRandomCoordinate(0, 300) )
    );
  }
}

Coordinate getRandomCoordinate(int lowerBound, int upperBound)
{
  Coordinate c = new Coordinate(
  getRandomNumber(lowerBound, upperBound),
  getRandomNumber(lowerBound, upperBound));
  return c;
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
  return number;
}
