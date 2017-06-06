class Stack <T> {

  ArrayList<T> _stack; 

  //constructor
  Stack() { 
    _stack = new ArrayList<T>();
  }


  //means of insertion
  void push(T s) {
    _stack.add(s);
  }


  T get() { 
    T retVal = null;
    if (!_stack.isEmpty()) {
      retVal = _stack.get(_stack.size() - 1);
    }
    return retVal;
  }

  void pop() {
    if (!_stack.isEmpty() && frameCount % 2 == 0) { // slight delay so traps dont all go poof
      _stack.remove(_stack.size() - 1);
    }
  }

  int size() {
    return _stack.size();
  }
}