public class Line extends Shape implements 
CardinalDirectionMover, KeyPressedListener
{
  Coordinate c1;
  Coordinate c2;
  
  public Line(Coordinate c1, Coordinate c2)
  {
    this.c1 = c1;
    this.c2 = c2;
    addDefaultKeyMappings();
  }
  
  void addDefaultKeyMappings()
  {
    keyHandlers.put('6', () -> moveRight(stepLength));
    keyHandlers.put('4', () -> moveLeft(stepLength));
    keyHandlers.put('2', () -> moveDown(stepLength));
    keyHandlers.put('8', () -> moveUp(stepLength));
    //keyHandlers.put('r', () -> recordingLogic());
    //keyHandlers.put('b', () -> backgroundLogic());
    //keyHandlers.put('p', () -> pauseLogic());
  }
  
  void moveUp(int moveLength)
  {
    c1.yCoordinate  = c1.yCoordinate - moveLength;
    c2.yCoordinate  = c2.yCoordinate - moveLength;
  }
  
  void moveDown(int moveLength)
  {
    c1.yCoordinate  = c1.yCoordinate + moveLength;
    c2.yCoordinate  = c2.yCoordinate + moveLength;
  }
  
  void moveLeft(int moveLength)
  {
  }
  
  void moveRight(int moveLength)
  {
  }
  
  @Override
  void onKeyPressed(char keyThatWasPressed)
  {
    Runnable command = keyHandlers.get(keyThatWasPressed);
    if (command != null) 
    {
        command.run();
    }
  }
  
  public void display()
  {
    super.display();
    stroke(255, 255, 255);
    line(c1.xCoordinate, c1.yCoordinate, c2.xCoordinate, c2.yCoordinate);
  }
}
