class Weapon{
  
 int damage;
 int price;
 double range;
 String names;
 
 Weapon(String name){
   names = name;
  if (name == "blaster"){
   damage = 10;
   price = 10;
   range = 100;
  }
  if(name == "laser"){
   damage = 7;
   price = 15;
   range = 1000;
  }
  if (name == "banana"){
   damage = 50;
   price = 20;
   range = 5;
  }
 }
 
 int getPrice(){
   return price; 
 }
 
 void shoot(){
   
 }
 
 void display(){
   
 }
  
}