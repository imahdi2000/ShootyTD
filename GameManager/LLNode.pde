class LLNode 
{

  private PImage _cargo;    //cargo may only be of type PImage
  private LLNode _nextNode; //pointer to next LLNode

  // constructor -- initializes instance vars
  public LLNode( PImage value, LLNode next ) 
  {
    _cargo = value;
    _nextNode = next;
  }


  //--------------v  ACCESSORS  v--------------
  public PImage getCargo() { 
    return _cargo;
  }

  public LLNode getNext() { 
    return _nextNode;
  }
  //--------------^  ACCESSORS  ^--------------


  //--------------v  MUTATORS  v--------------
  public PImage setCargo( PImage newCargo ) 
  {
    PImage foo = getCargo();
    _cargo = newCargo;
    return foo;
  }

  public LLNode setNext( LLNode newNext ) 
  {
    LLNode foo = getNext();
    _nextNode = newNext;
    return foo;
  }
  //--------------^  MUTATORS  ^--------------

}