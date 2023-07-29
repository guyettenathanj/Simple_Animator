public class Shape implements CardinalDirectionMover
{
  public List<Coordinate> positionHistory = new ArrayList<Coordinate>();
  public Boolean recordingMode = false;
  public Coordinate position = new Coordinate();
  
  void mouseLogic()
  {
    if (mousePressed)
    {
      position.xCoordinate = mouseX;
      position.yCoordinate = mouseY;
      addCurrentPositionToHistory();
    }
  }  
  
  private void addCurrentPositionToHistory()
  {
    if(recordingMode)
    {
      positionHistory.add(new Coordinate(position.xCoordinate, 
      position.yCoordinate));
    }
  }
  
  @Override
  void moveUp(int moveLength)
  {
    position.yCoordinate = position.yCoordinate - moveLength;   
    addCurrentPositionToHistory();
  }
  
  @Override
  void moveDown(int moveLength)
  {
    position.yCoordinate = position.yCoordinate + moveLength;
    addCurrentPositionToHistory();
  }
  
  @Override
  void moveLeft(int moveLength)
  {
    position.xCoordinate = position.xCoordinate - moveLength;
    addCurrentPositionToHistory();
  }
  
  @Override
  void moveRight(int moveLength)
  {
    position.xCoordinate = position.xCoordinate + moveLength;
    addCurrentPositionToHistory();
  }  
}
