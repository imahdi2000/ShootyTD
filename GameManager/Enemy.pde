class Enemy extends PVector {

  PVector dir;
  int startingHP;
  int currentHP;
  int damage;
  int goldAmount;
  Boolean isDead;
  Object target;
  color c;
  PVector bob = new PVector(-1, 1);


  Enemy() {
    super(800, 300);
    startingHP = 100;
    currentHP = 100;
    goldAmount = 50;
    isDead = false;
    c = color(102, 102, 102);
    dir = bob;
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
    dir.x = x;
  }

  void setDirY(float y) {
    dir.y = y;
  }

  void move() {      
    //this.add(bob);
    //this.add(dir);
    if (this.x > 320) {
      setDirX(-1);
    } else {
      setDirX(1);
    }
    if (this.y > 300) {
      setDirY(-1);
    } else {
      setDirY(1);
    }
    this.add(dir);
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