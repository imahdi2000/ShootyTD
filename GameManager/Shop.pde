class Shop {
  ArrayList<Button> button;
  ArrayList<Turret> turrets;
  ArrayList<Trap> traps;
  ArrayList<Weapon> weapons;
  float x = 700;
  float y = 600;
  float w = 150;
  float h = 80;

  // Setup Shop
  Shop() {
    //price is 3rd item in constructor
    weapons = new ArrayList<Weapon>();
    Weapon blaster = new Weapon("Blaster", 30, 100, 20, 100);
    Weapon laser = new Weapon("Laser", 40, 200, 16, 500);
    Weapon banana = new Weapon("Banana", 40, 350, 12, 1000);

    button = new ArrayList<Button>();

    Button blast = new Button(200, 600, 150, 80, blaster.price, blaster);
    button.add(blast);
    Button las = new Button(360, 600, 150, 80, laser.price, laser);
    button.add(las);    
    Button ban = new Button(520, 600, 150, 80, banana.price, banana);
    button.add(ban);  
    Button turr = new Button(680, 600, 150, 50, 80);
    turr.hasTurret = true;
    button.add(turr); 
    Button tra = new Button(840, 600, 150, 50, 80);
    tra.hasTrap = true;
    button.add(tra);

    // Temp
    player.addWeapon(new Weapon("default", 30, 0, 24, 100));
    weapons.add(blaster);
    weapons.add(laser);
    weapons.add(banana);
  }


  void buy() {
    for (int i = 0; i<button.size(); i++) {
      button.get(i).buy();
    }
  }

  void display() {
    fill(color(200,200,200)); // gray
    rect(-1, height / 1.3, width + 1, height / 1.3);

    for (int i = 0; i < button.size(); i++) {
      button.get(i).display();
    }
  }

  void pressed() {
    for (int x = 0; x < button.size(); x ++) {
      button.get(x).pressed();
    }
  }
}