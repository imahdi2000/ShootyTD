class Shop{
 ArrayList<Weapon> weapons;
 ArrayList<Turret> turrets;
 ArrayList<Trap> traps;
 
Shop(){
  Weapon blaster = new Weapon("blaster");
  Weapon laser = new Weapon("laser");
  Weapon banana = new Weapon("banana");
  weapons.add(blaster);
  weapons.add(laser);
  weapons.add(banana);
}

void buy(Weapon pewpew, Player player){
  if (afford(pewpew)){
    player.setMoney(pewpew.getPrice());
    player.setWeapons(pewpew);
  }
}

boolean afford(Weapon pewpew){
  return player.getMoney() > pewpew.getPrice();
}

void display(){
  
}
     
  
}