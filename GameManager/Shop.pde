class Shop {
  
  ArrayList<Weapon> weapons;
  ArrayList<Turret> turrets;
  ArrayList<Trap> traps;
  // Temporary
  float x = 525;
  float y = 600;
  float w = 150;
  float h = 80;

  // Setup Shop
  Shop() {
    weapons = new ArrayList<Weapon>();
    Weapon blaster = new Weapon("blaster", 10, 10, 15, 100);
    Weapon laser = new Weapon("laser", 7, 15, 10, 500);
    Weapon banana = new Weapon("banana", 50, 20, 2, 1000);
    weapons.add(blaster);
    
    player.addWeapon(blaster);
    
    weapons.add(laser);
    weapons.add(banana);
  }

  void buy() {
    // If mouse is hovering over CORRESPONDING button
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (afford(weapons.get(2))) { // And weapon is not in player.inv
        player.decreaseMoney(weapons.get(2).getPrice());
        player.addWeapon(weapons.get(2));
        System.out.println("Buy " + weapons.get(2).getName());
        player.setCurrentWeapon(1);
      }
    }
  }

  boolean afford(Weapon pewpew) {
    return player.getMoney() > pewpew.getPrice();
  }

  void display() {
    rect(x, y, w, h);
    fill(255);
  }
}