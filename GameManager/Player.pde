class Player {

  int startingHP;
  int currentHP;
  int money;
  //ArrayList<Weapon> weapons
  Boolean isDead;
  color c;
  
  Player() {
    startingHP = 100;
    currentHP = 100;
    money = 0;
    //weapons = new ArrayList<Weapon>();
    isDead = false;
    c = color(102, 255, 102);
  }

  void move() {
  }

  void shoot() {
  }

  void takeDamage(int damage) {
  }

  void dead() {
  }

  void display() {
    fill(c);
    triangle(30, 75, 58, 20, 86, 75);
  }
}