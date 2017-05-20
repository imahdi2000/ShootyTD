class Enemy extends PVector {

  PVector dir;
  int startingHP;
  int currentHP;
  int damage;
  int goldAmount;
  Boolean isDead;
  Object target;
  color c;

  Enemy() {
    super(600, 300);
    startingHP = 100;
    currentHP = 100;
    goldAmount = 50;
    isDead = false;
    c = color(102, 102, 102);
  }

  void setDirX(float x) {
    dir.x = x;
  }

  void setDirY(float y) {
    dir.y = y;
  }

  void move() {
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