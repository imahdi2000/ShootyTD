public class LList implements List 

  //instance vars
  private LLNode _head;
  private int _size;

  // constructor -- initializes instance vars
  public LList( ) 
  {
    _head = null; //at birth, a list has no elements
    _size = 0;
  }


  //--------------v  List interface methods  v--------------

  public boolean add( String newVal )
  { 
    LLNode tmp = new LLNode( newVal, _head );
    _head = tmp;
    _size++;
    return true;
  } 


  public String get( int index )
  { 
    if ( index < 0 || index >= size() )
      throw new IndexOutOfBoundsException();

    String retVal;
    LLNode tmp = _head; //create alias to head

    //walk to desired node
    for ( int i=0; i < index; i++ )
      tmp = tmp.getNext();

    //check target node's cargo hold
    retVal = tmp.getCargo();
    return retVal;
  } 


  public String set( int index, String newVal )
  { 
    if ( index < 0 || index >= size() )
      throw new IndexOutOfBoundsException();

    LLNode tmp = _head; //create alias to head

    //walk to desired node
    for ( int i=0; i < index; i++ )
      tmp = tmp.getNext();

    //store target node's cargo
    String oldVal = tmp.getCargo();

    //modify target node's cargo
    tmp.setCargo( newVal );

    return oldVal;
  } 

  //return number of nodes in list
  public int size() { 
    return _size;
  } 

  //--------------^  List interface methods  ^--------------


  // override inherited toString
  public String toString() { 
    String retStr = "HEAD->";
    LLNode tmp = _head; //init tr
    while ( tmp != null ) {
      retStr += tmp.getCargo() + "->";
      tmp = tmp.getNext();
    }
    retStr += "NULL";
    return retStr;
  }
}