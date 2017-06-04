class Queue<T> {

  ArrayList<T> _queue;

  // Default Constructor
  public Queue() { 
    _queue = new ArrayList<T>();
  }


  // Add item to end of queue
  void enqueue( T x ) {
    _queue.add(x);
  }


  // Remove next item in queue
  T dequeue() {
    return _queue.remove(0);
  }


  // Peek next item in queue
  T peekFront() {
    return _queue.get(0);
  }

  // Size
  int size() {
    return _queue.size();  
  }
  
  // Check if empty
  boolean isEmpty() {
    return _queue.isEmpty();
  }
  
}