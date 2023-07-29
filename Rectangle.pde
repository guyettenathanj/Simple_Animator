import java.util.List;
import java.util.ArrayList;

public class Rectangle extends Shape implements 
CardinalDirectionMover, MouseHoverListener, KeyPressedListener
{
  int stepLength = 10;
  public color currentFillColor = color(255, 255, 255);
  int rectWidth = 100;
  int rectHeight = 100;  
  
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
  
  public Rectangle(int xCoordinate, int yCoordinate)
  {
    position.xCoordinate = xCoordinate;
    position.yCoordinate = yCoordinate;
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
  
  @Override
  public void onMouseHover() 
  {
    if(!recordingMode)
    {
      currentFillColor = color(0, 255, 0);
    }
  }
  
  @Override
  void onKeyPressed(char keyThatWasPressed)
  {
    if (key == '6') 
    {
      moveRight(stepLength);
    }
    else if (key == '4') 
    {
      moveLeft(stepLength);
    } 
    else if (key == '2') 
    {
      moveDown(stepLength);
    }
    else if (key == '8')
    {
      moveUp(stepLength);
    }
    else if (key == 'r') 
    {
      recordingMode = !recordingMode;
      if(recordingMode)
      {
        setRecordingMode(true);
        playbackPositionHistory(50);
        currentFillColor = color(getRandomNumber(50, 255), getRandomNumber(0,1 ), 0);
      }
    else if(!recordingMode)
    {
      setRecordingMode(false);
      currentFillColor = color(getRandomNumber(0, 255), 255, 255); 
    }
  }
    else if (key == 'b') 
    {
      drawbackground = !drawbackground;
    } 
  }
  
  public void onMouseOutside()
  {
    currentFillColor = color(255, 255, 255); 
  }
}
