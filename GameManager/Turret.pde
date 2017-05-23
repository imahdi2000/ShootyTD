class Turret extends PVector{
  int startingHP; 
  int currentHP; 
  int damage;
  int price;
  double fireRate;
  double range;
  PVector loc;

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
    imageMode(CENTER);
    image(turr,x,y);
  }
}