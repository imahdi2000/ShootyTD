class Button {
  int price;
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

  Button(float x1, float y1, float w1, int nPrice, float h1) {
    price = nPrice;
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    weapon = null;
    c = color(0, 180, 255);
  }

  Button(float x1, float y1, float w1, float h1, int nPrice, Weapon g) {
    price = nPrice;
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
      if (hasweapon && afford(weapon)) {
        hasweapon = false;
      } else if (hasTurret) {//turret button
        buyingTurret = true;
      } else if (hasTrap) {//trap button
        buyingTrap = true;
      }
    }
  }

  void buy() {
    // If mouse is hovering over CORRESPONDING button
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (hasweapon == true && afford(weapon)) { // And weapon is not in player.inv
        player.decreaseMoney(weapon.getPrice());
        player.addWeapon(weapon);
        //System.out.println("Buy " + weapon.getName());
        player.setCurrentWeapon(1);
        hasweapon = false;
      }
    }
  }

  boolean afford(Weapon pewpew) {
    return player.getMoney() >= pewpew.getPrice();
  }
  /*
  int damage;
   int price;
   int fireRate;
   double range;
   String name;
   */
  void display() { 
    color oldC = c;
    fill(c);
    rect(x, y, w, h);
    textSize(20);
    textAlign(LEFT);
    c = color(0, 0, 0); 
    fill(c);
    if (hasweapon) {
      text(weapon.name + ":" +  "$" + price, x + 15, y + 20);
      textSize(10);
      text("Damage:" + weapon.damage, x + 15, y + 30);
      text("FireRate:" + weapon.fireRate, x + 15, y + 40);
      text("Range:" + weapon.range, x + 15, y + 50);
    } else if (hasTrap) {
      text("Trap: $40", x + 15, y + 20);
    } else if (hasTurret) {
      text("Turret: $200", x + 15, y + 20);
    }
    c = oldC;
  }
}