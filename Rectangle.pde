import java.util.List;
import java.util.ArrayList;

public class Rectangle implements CardinalDirectionMover, MouseHoverListener
{

  public List<Coordinate> positionHistory = new ArrayList<Coordinate>();
  public Coordinate position = new Coordinate();
  public color currentFillColor = color(255, 255, 255); 

  private int rectWidth;
  private int rectHeight;  
  private Boolean recordingMode = false;
  
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
  
  public void playbackPositionHistory(int timeBetweenFramesInMilliSeconds)
  {
    new java.util.Timer().schedule( 
      new java.util.TimerTask() {
        private int positionIndex = 0;

        @Override
        public void run() {
          if (positionIndex < positionHistory.size()) {
            Coordinate element = positionHistory.get(positionIndex);
            position.xCoordinate = element.xCoordinate;
            position.yCoordinate = element.yCoordinate;
            display();
            positionIndex++;
          } else {
            // Cancel the timer when we've played back all history.
            this.cancel();
          }
        }
      }, 
      0,      // Start immediately
      timeBetweenFramesInMilliSeconds
    );
  }

  public void display()
  {
    fill(currentFillColor);
    rect(position.xCoordinate, position.yCoordinate, rectWidth, rectHeight);
    mouseLogic();
  }

  
  public boolean containsPoint(int x, int y) 
  {
    return isInsideHorizontalBounds(x) && isInsideVerticalBounds(y);
  }
  
  public boolean isInsideHorizontalBounds(int x)
  {
    boolean returnValue = (x >= position.xCoordinate) 
    && 
    (x <= position.xCoordinate + rectWidth);
    return returnValue;
  }
  
  public boolean isInsideVerticalBounds(int y)
  {
    boolean returnValue = 
    (y >= position.yCoordinate) && (y <= position.yCoordinate + rectHeight);
    return returnValue;
  }

  public void setRecordingMode(Boolean recordingMode)
  {
    this.recordingMode = recordingMode;
  }
  
  void mouseLogic()
  {
    if (mousePressed)
    {
      position.xCoordinate = mouseX;
      position.yCoordinate = mouseY;
      addCurrentPositionToHistory();
    } 
  }
  
  @Override
  public void onMouseHover() 
  {
    currentFillColor = color(0, 255, 0);
  }
  
  public void onMouseOutside()
  {
    currentFillColor = color(255, 255, 255); 
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
  
  private void addCurrentPositionToHistory()
  {
    if(recordingMode)
    {
      positionHistory.add(new Coordinate(position.xCoordinate, position.yCoordinate));
    }
  }  
}
