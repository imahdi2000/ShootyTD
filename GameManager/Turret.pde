class Turret extends PVector {

  int startingHP; 
  int currentHP; 
  int damage;
  int price;
  double fireRate;
  double range;
  PVector target;
  //PVector loc;

  Turret(Enemy newTarget) {
    super(width / 2, height / 2 - 100);
    startingHP = 50;
    currentHP = 50;
    damage = 5;
    price = 10;
    fireRate = 30;
    range = 250;
    target = newTarget;
  }

  void takeDamage(int damage) {
  }

  boolean enemyInRange() {
    return dist(this, target) < range;
  }

  void shoot() {
  }

  boolean isTargetDead() {
    return ((Enemy)target).isDead();
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

  void display() {
    imageMode(CENTER);
    image(turr, x, y);
  }
}