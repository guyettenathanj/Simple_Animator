public interface PositionPlaybackAndRecord
{
  void recordPosition();
  void playbackPositions(int timeBetweenFramesInMilliSeconds);
  void playBackPositions(int timeBetweenFramesInMilliSeconds,
  int startIndex, int endIndex);
}
