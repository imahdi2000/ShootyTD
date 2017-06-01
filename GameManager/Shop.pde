class Shop {
  ArrayList<Button> button;
  ArrayList<Turret> turrets;
  ArrayList<Trap> traps;
  ArrayList<Weapon> weapons;
  //buying = false;
  float x = 700;
  float y = 600;
  float w = 150;
  float h = 80;
  // Temporary (we will add button c
  // Setup Shop
  Shop() {
    weapons = new ArrayList<Weapon>();
    Weapon blaster = new Weapon("blaster", 10, 10, 15, 100);
    Weapon laser = new Weapon("laser", 7, 15, 10, 500);
    Weapon banana = new Weapon("banana", 50, 20, 2, 1000);

    button = new ArrayList<Button>();

    Button blast = new Button(200, 600, 150, 80, blaster);
    button.add(blast);
    Button las = new Button(360, 600, 150, 80, laser);
    button.add(las);    
    Button ban = new Button(520, 600, 150, 80, banana);
    button.add(ban);  
    Button turr = new Button(680, 600, 150, 80);
    button.add(turr); 
    Button tra = new Button(840, 600, 150, 80);
    button.add(tra);

    // Temp
    player.addWeapon(blaster);

    weapons.add(laser);
    weapons.add(banana);
  }


  void buy() {
  for(int i = 0; i<button.size();i++){
   button.get(i).buy(); 
  }
  }
  
  void display() {
    for (int i = 0; i < button.size(); i++) {
      button.get(i).display();
    }
  }
}