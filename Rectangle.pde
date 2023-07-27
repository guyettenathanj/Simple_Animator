import java.util.List;
import java.util.ArrayList;

public class Rectangle implements CardinalDirectionMover
{

  public List<Coordinate> positionHistory = new ArrayList<Coordinate>();
  public Coordinate position  = new Coordinate();

  private int rectWidth;
  private int rectHeight;  
  
  public Rectangle()
  {
    position.xCoordinate = 40;
    position.yCoordinate = 40;
    rectWidth = 100;
    rectHeight = 100;
  }
  
  public Rectangle(int xCoordinate, int yCoordinate, 
  int rectWidth, int rectHeight)
  {
    position.xCoordinate = xCoordinate;
    position.yCoordinate = yCoordinate;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
  }
  
  public void setPosition(int xCoordinate, int yCoordinate)
  {
    position.xCoordinate = xCoordinate;
    position.yCoordinate = yCoordinate;
  }
  
  public void display()
  {
    mouseLogic();
    rect(position.xCoordinate, position.yCoordinate, rectWidth, rectHeight);
  }
  
  void mouseLogic()
  {
    if (mousePressed)
    {
      position.xCoordinate = mouseX;
      position.yCoordinate = mouseY;
    } 
  }
  
  void moveUp(int moveLength)
  {
    position.yCoordinate = position.yCoordinate - moveLength;
  }
  
  void moveDown(int moveLength)
  {
    position.yCoordinate = position.yCoordinate + stepLength;
  }
  
  void moveLeft(int moveLength)
  {
    position.xCoordinate = position.xCoordinate - stepLength;
  }
  
  void moveRight(int moveLength)
  {
    position.xCoordinate = position.xCoordinate + stepLength;
  }
}
