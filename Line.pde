public class Line extends Shape
{
  Coordinate c1;
  Coordinate c2;
  
  public Line(Coordinate c1, Coordinate c2)
  {
    this.c1 = c1;
    this.c2 = c2;
  }
  
  public void display()
  {
    super.display();
    stroke(255, 255, 255);
    line(c1.xCoordinate, c1.yCoordinate, c2.xCoordinate, c2.yCoordinate);
  }
}
