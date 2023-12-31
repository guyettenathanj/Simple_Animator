import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Rectangle extends Shape implements 
CardinalDirectionMover
{
  int stepLength = 10;

  int rectWidth = 100;
  int rectHeight = 100;
  Boolean paused = false;
  
  
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
    addDefaultKeyMappings();
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
    keyHandlers.put('r', () -> recordingLogic());
    keyHandlers.put('b', () -> backgroundLogic());
    keyHandlers.put('p', () -> pauseLogic());
  }
  
  @Override
  public void display()
  {
    super.display();
    rect(position.xCoordinate, position.yCoordinate, rectWidth, rectHeight);
  }
  
  void pauseLogic()
  {
    paused = !paused;
  }
  
  void recordingLogic()
  {
    recordingMode = !recordingMode;
    if(recordingMode)
    {
      if(!paused)
      {
        setRecordingMode(true);
        playbackPositionHistory(50);
        currentFillColor = color(getRandomNumber(50, 255),
        getRandomNumber(0,1 ), 0);
      }
    }
    else if(!recordingMode)
    {
      setRecordingMode(false);
      currentFillColor = color(getRandomNumber(0, 255), 255, 255); 
    }
  }
  
  void backgroundLogic()
  {
    drawbackground = !drawbackground;
  }

  public void setRecordingMode(Boolean recordingMode)
  {
    this.recordingMode = recordingMode;
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
  

}
