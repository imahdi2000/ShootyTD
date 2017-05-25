class Shop {
  ArrayList<Weapon> weapons;
  ArrayList<Turret> turrets;
  ArrayList<Trap> traps;
  float x = 525;
  float y = 600;
  float w = 150;
  float h = 80;

  Shop() {
    weapons = new ArrayList<Weapon>();
    Weapon blaster = new Weapon("blaster");
    Weapon laser = new Weapon("laser");
    Weapon banana = new Weapon("banana");
    weapons.add(blaster);
    weapons.add(laser);
    weapons.add(banana);
  }

  void buy(Weapon pewpew) {
    if (afford(pewpew)) {
      player.setMoney(pewpew.getPrice());
      player.setWeapons(pewpew);
    }
  }

  boolean afford(Weapon pewpew) {
    return player.getMoney() > pewpew.getPrice();
  }

  void display() {
    rect(x, y, w, h);
    fill(255);
    if (mousePressed) {
      if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
        println("The mouse is pressed and over the button");
        fill(0);
        if (afford(weapons.get(0))){
         buy(weapons.get(0)); 
         println("Payload has been delivered");
        }
      }
    }
  }
}