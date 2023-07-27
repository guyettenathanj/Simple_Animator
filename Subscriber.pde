interface Subscriber
{
  void addSubscription(Event event, Runnable eventHandler);
}
