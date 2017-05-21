class Turret {
  int startingHP; 
  int currentHP; 
  int damage;
  int price;
  double fireRate;
  double range;
  ArrayList<Enemy> inRange;

  Turret() {
    startingHP = 50; 
     price = 10;
     fireRate = 4;
     range = 5.5;
  }

  void takeDamage(int dam) {
  }

  boolean enemyInRange() {
    return false;
  }

  void shoot() {
  }

  void display() {
  }
}