class Button {
  int price;
  int damage;
  float x;
  float y;
  float w;
  float h;
  color c;
  Weapon weapon;
  boolean hasweapon = false;
  boolean hasTurret = false;
  boolean hasTrap = false;  
  boolean triggered = false;

  Button(float x1, float y1, float w1, float h1) {
    price = 0;
    damage = 0;
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    weapon = null;
  }

  Button(float x1, float y1, float w1, float h1, Weapon g) {
    price = 0;
    damage = 0;
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    weapon = g;
    c = color(0, 255, 0);
    hasweapon = true;
  }

  void pressed() {
    // If mouse is hovering over CORRESPONDING button
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (hasweapon == true) {
        hasweapon = false;
      } else { 
        buying = true;
      }
    }
  }

  void buy() {
    // If mouse is hovering over CORRESPONDING button
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (hasweapon == true && afford(weapon)) { // And weapon is not in player.inv
        player.decreaseMoney(weapon.getPrice());
        player.addWeapon(weapon);
        System.out.println("Buy " + weapon.getName());
        player.setCurrentWeapon(1);
      }
    }
  }

  boolean afford(Weapon pewpew) {
    return player.getMoney() > pewpew.getPrice();
  }

  void display() { 
    fill(c);
    rect(x, y, w, h);
  }
}