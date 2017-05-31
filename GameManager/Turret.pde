class Turret extends PVector {

  int startingHP; 
  int currentHP; 
  int damage;
  int price;
  double fireRate;
  double range;
  PVector target;
  //PVector loc;

  Turret(Enemy newTarget, int newX, int newY) {
    super(newX, newY);
    startingHP = 50;
    currentHP = 50;
    damage = 5;
    price = 10;
    fireRate = 30;
    range = 250;
    target = newTarget;
  }

  void takeDamage(int damage) {
    currentHP -= damage;
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

  // Health Bar
  void healthBar() {
    if (currentHP >= 0) {
      // Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - 25, y - 25, 50, 5);

      // Bar
      float drawWidth = (float(currentHP) / startingHP) * 50;
      fill(0, 255, 0); // Green
      rect(x - 25, y - 25, drawWidth, 5);
    }
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