class Turret extends Attributes {

  int damage;
  int price;
  double fireRate;
  double range;
  PVector target;

  Turret(PVector newTarget, int newX, int newY, int startingHP, int nDamage) {
    super(newX, newY, startingHP, startingHP);
    damage = nDamage;
    price = 10;
    fireRate = (int)random(15,31);
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