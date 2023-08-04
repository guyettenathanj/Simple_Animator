public class Line extends Shape implements 
CardinalDirectionMover, KeyPressedListener, PositionPlaybackAndRecord
{
  Boolean paused = false;
  Coordinate c1;
  Coordinate c2;
  public Boolean recordingMode = false;
  public List<LineCoordinate> positionHistory = new ArrayList<LineCoordinate>();
  
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
    keyHandlers.put('r', () -> recordingLogic());
    //keyHandlers.put('b', () -> backgroundLogic());
    //keyHandlers.put('p', () -> pauseLogic());
  }
  
  void recordingLogic()
  {
    // TODO: Fix this, none of this logic works
    recordingMode = !recordingMode;
    if(recordingMode)
    {
      if(!paused)
      {
        super.currentFillColor = color(255, 0, 0);
        recordingMode = true;
        playbackPositionHistory(50);
      }
    }
    else if(!recordingMode)
    {
      recordingMode = false;
    }
  }
  
  void recordPosition() 
  {
    if(recordingMode)
    {
      positionHistory.add(new LineCoordinate(c1, c2));
    }
  }
  
  void playbackPositions(int timeBetweenFramesInMilliSeconds)
  {
  }
  
  void playBackPositions(int timeBetweenFramesInMilliSeconds, 
  int startIndex, int endIndex)
  {
  }
  
  void moveUp(int moveLength)
  {
    c1.yCoordinate  = c1.yCoordinate - moveLength;
    c2.yCoordinate  = c2.yCoordinate - moveLength;
    recordPosition();
  }
  
  void moveDown(int moveLength)
  {
    c1.yCoordinate  = c1.yCoordinate + moveLength;
    c2.yCoordinate  = c2.yCoordinate + moveLength;
    recordPosition();
  }
  
  void moveLeft(int moveLength)
  {
    c1.xCoordinate  = c1.xCoordinate - moveLength;
    c2.xCoordinate  = c2.xCoordinate - moveLength;
    recordPosition();
  }
  
  void moveRight(int moveLength)
  {
    c1.xCoordinate  = c1.xCoordinate + moveLength;
    c2.xCoordinate  = c2.xCoordinate + moveLength;
    recordPosition();
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
    stroke(super.currentFillColor);
    line(c1.xCoordinate, c1.yCoordinate, c2.xCoordinate, c2.yCoordinate);
  }
  
  void printColorComponents(color c)
  {
    println("Red: " + (int)red(c));
    println("Green: " + (int)green(c));
    println("Blue: " + (int)blue(c));
  }
}