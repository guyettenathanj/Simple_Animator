import java.util.List;
import java.util.ArrayList;

public class Rectangle implements CardinalDirectionMover
{

  public List<Coordinate> positionHistory = new ArrayList<Coordinate>();
  public Coordinate position  = new Coordinate();

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
  
public void playbackHistory(int timeBetweenFrames)
{
  System.out.println("playbackHistory called...");
  
  new java.util.Timer().schedule( 
    new java.util.TimerTask() {
      private int index = 0;

      @Override
      public void run() {
        if (index < positionHistory.size()) {
          Coordinate element = positionHistory.get(index);
          position.xCoordinate = element.xCoordinate;
          position.yCoordinate = element.yCoordinate;
          display();
          index++;
        } else {
          // Cancel the timer when we've played back all history.
          this.cancel();
        }
      }
    }, 
    0,      // Start immediately
    timeBetweenFrames
  );
}

  
  public void display()
  {
    mouseLogic();
    rect(position.xCoordinate, position.yCoordinate, rectWidth, rectHeight);
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
  
  void moveUp(int moveLength)
  {
    position.yCoordinate = position.yCoordinate - moveLength;   
    addCurrentPositionToHistory();
  }
  
  void moveDown(int moveLength)
  {
    position.yCoordinate = position.yCoordinate + moveLength;
    addCurrentPositionToHistory();
  }
  
  void moveLeft(int moveLength)
  {
    position.xCoordinate = position.xCoordinate - moveLength;
    addCurrentPositionToHistory();
  }
  
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
