class Gold{
  int amount;
  
  Gold(){
   amount = 1; 
  }
  
  Gold(int val){
   amount = val; 
  }
  
  void pickupGold(){
    
  }
  
  void display(){
     imageMode(CENTER);
   // image(gol,x,y);
  }
  
  int getAmount(){
   return amount; 
  }
  
  void setAmount(int val){
   amount = val;
  }
 
  
}