class Enemy extends PVector {

  PVector dir;
  PVector target;
  float speed;
  int startingHP;
  int currentHP;
  int damage;
  int goldAmount;
  Boolean isDead;
  Boolean inRangeNexus; // player does not get attacked if target is nexus
  color c;

  Enemy(PVector newTarget) {
    super(random(1200), random(720));
    dir = new PVector();
    target = newTarget;
    speed = 2;
    startingHP = 100;
    currentHP = 100;
    damage = 1;
    goldAmount = 50;
    isDead = false;
    inRangeNexus = false;
    c = color(102, 102, 102);
  }

  void move() {   
    if (this.x == target.x && this.y == target.y) {
      dir.x = 0;
      dir.y = 0;
    }
    this.add(dir);
    if (this.y > target.y) { // Down
      dir.y = -speed;
    } else if (this.y < target.y) { // Up
      dir.y = speed;
    }
    if (this.x > target.x) { // Left
      dir.x = -speed;
    } else if (this.x < target.x) { // Right
      dir.x = speed;
    }
  }

  // TODO: DELAY ATTACKS WITH A COUNTER
  void attackPlayer(Player player) {
    // If it touches target (player --> smack smack)
    // Attack player
    if (dist(this, player) < 15 && !inRangeNexus) {
      player.takeDamage(damage);
    }
  }
  
  void attackTurret(Turret turret) {
    // If it touches target (turret --> smack smack)
    // Attack turret
    if (dist(this, turret) < 15) {
      turret.takeDamage(damage);
    }
  }
  
  void attackNexus(Nexus nexus) {
    // Attack Nexus
    // Switch target to nexus
    if (dist(this, nexus) < 150) {
       inRangeNexus = true;
       target = nexus;
    }
    
    if (inRangeNexus) {
      nexus.takeDamage(damage);
    }
  }
  
  void takeDamage(int damage) {
    currentHP -= damage;
  }

  void dead() {
    if (currentHP <= 0) {
      isDead = true;
    }
  }

  boolean isDead() {
    return isDead;
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

  void display() {
    fill(c);
    // ellipse(x, y, 30, 30);
    imageMode(CENTER);
    image(ene, x, y);
    healthBar();
  }
}