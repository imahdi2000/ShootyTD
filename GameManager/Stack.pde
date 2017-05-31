class Stack <T> {

  ArrayList<T> _stack; 

  //constructor
  Stack() { 
    _stack = new ArrayList<T>();
  }


  //means of insertion
  void push( T s ) {
    _stack.add(s);
  }


  //means of removal
  T pop( ) { 
    T retVal = null;
    retVal = _stack.get(_stack.size());
    return retVal;
  }
}