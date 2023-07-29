import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Rectangle extends Shape implements 
CardinalDirectionMover, MouseHoverListener, KeyPressedListener
{
  int stepLength = 10;

  int rectWidth = 100;
  int rectHeight = 100;  
  Boolean paused = false; 
  Map<Character, Runnable> keyHandlers = new HashMap<>();
  
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
    addDefaultKeyMappings();
  }
  
  void addDefaultKeyMappings()
  {
    keyHandlers.put('6', () -> moveRight(stepLength));
    keyHandlers.put('4', () -> moveLeft(stepLength));
    keyHandlers.put('2', () -> moveDown(stepLength));
    keyHandlers.put('8', () -> moveUp(stepLength));
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
    Runnable command = keyHandlers.get(keyThatWasPressed);
    if (command != null) {
        command.run();
    }
    
    else if (key == 'r') 
    {
      recordingMode = !recordingMode;
      if(recordingMode)
      {
        if(!paused)
        {
          setRecordingMode(true);
          playbackPositionHistory(50);
          currentFillColor = color(getRandomNumber(50, 255), getRandomNumber(0,1 ), 0);
        }
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
    
    else if (key == 'p') 
    {
      paused = !paused;
    }
  }
  
  public void onMouseOutside()
  {
    currentFillColor = color(255, 255, 255); 
  }
}
