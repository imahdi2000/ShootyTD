class Turret extends Attributes {

  int damage;
  int price;
  double fireRate;
  double range;
  PVector target;

  Turret(Enemy newTarget, int newX, int newY) {
    super(newX, newY, 100, 100);
    damage = 5;
    price = 10;
    fireRate = 30;
    range = 250;
    target = newTarget;
  }

  boolean enemyInRange() {
    return dist(this, target) < range;
  }

  boolean isTargetDead() {
    return ((Attributes)target).isDead;
  }

  double getFireRate() {
    return fireRate;
  } 

  void findTarget(ArrayList<Enemy> enemies) {
    PVector newTarget = target;
    for (int e = 0; e < enemies.size(); e++) {
      if (dist(this, enemies.get(e)) < dist(this, newTarget)) {
        newTarget = enemies.get(e);
      }
    }
    target = newTarget;
  }
  
  int getPrice(){
   return price; 
  }
  
  void display() {
    healthBar();
    imageMode(CENTER);
    image(turr, x, y);
  }
}