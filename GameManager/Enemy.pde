class Enemy extends PVector {

  PVector dir;
  int startingHP;
  int currentHP;
  int damage;
  int goldAmount;
  Boolean isDead;
  Object target;
  color c;
  PVector bob = new PVector(-1,1);


  Enemy() {
    super(800, 300);
    startingHP = 100;
    currentHP = 100;
    goldAmount = 50;
    isDead = false;
    c = color(102, 102, 102);
  }

  Enemy(PVector nexusloc) {
    super(800, 300);
    startingHP = 100;
    currentHP = 100;
    goldAmount = 50;
    isDead = false;
    c = color(102, 102, 102);
    dir = nexusloc;
  }

  void setDirX(float x) {
   // dir.x = x;
  }

  void setDirY(float y) {
   // dir.y = y;
  }

  void move() {      
    this.add(bob);
  }

  void attack(Object x) {
  }

  void dropGold() {
  }

  void takeDamage(int damage) {
    currentHP -= damage;
  }

  void dead() {
  }

  void display() {
    fill(c);
    ellipse(x, y, 30, 30);
  }
}