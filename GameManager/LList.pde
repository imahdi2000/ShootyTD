class LList implements List { 

  //instance vars
  LLNode _head;
  int _size;

  // constructor -- initializes instance vars
  LList( ) 
  {
    _head = null; //at birth, a list has no elements
    _size = 0;
  }


  //--------------v  List interface methods  v--------------

  boolean add( PImage newVal )
  { 
    LLNode tmp = new LLNode( newVal, _head );
    _head = tmp;
    _size++;
    return true;
  } 


  PImage get( int index )
  { 
    if ( index < 0 || index >= size() )
      throw new IndexOutOfBoundsException();

    PImage retVal;
    LLNode tmp = _head; //create alias to head

    //walk to desired node
    for ( int i=0; i < index; i++ )
      tmp = tmp.getNext();

    //check target node's cargo hold
    retVal = tmp.getCargo();
    return retVal;
  } 


  PImage set( int index, PImage newVal )
  { 
    if ( index < 0 || index >= size() )
      throw new IndexOutOfBoundsException();

    LLNode tmp = _head; //create alias to head

    //walk to desired node
    for ( int i=0; i < index; i++ )
      tmp = tmp.getNext();

    //store target node's cargo
    PImage oldVal = tmp.getCargo();

    //modify target node's cargo
    tmp.setCargo( newVal );

    return oldVal;
  } 

  //return number of nodes in list
  int size() { 
    return _size;
  } 

  //--------------^  List interface methods  ^--------------

}