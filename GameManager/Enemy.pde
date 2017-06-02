class Enemy extends Attributes {

  PVector target;
  float speed;
  int damage;
  int goldAmount;
  boolean inRangeNexus; // player does not get attacked if target is nexus
  boolean inRangeTurret;

  Enemy(PVector newTarget) {
    super((int)random(1200), (int)random(720), 100, 100);
    target = newTarget;
    speed = 2;
    damage = 1;
    goldAmount = 50;
    inRangeNexus = false;
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
    if (dist(this, turret) < 100 && !inRangeNexus) {
      inRangeTurret = true;
      target = turret;
    }

    if (inRangeTurret && dist(this, turret) < 30) {
      turret.takeDamage(damage);
    }
  }

  void attackNexus(Nexus nexus) {
    // Attack Nexus
    // Switch target to nexus
    if (dist(this, nexus) < 150 && !inRangeTurret) {
      inRangeNexus = true;
      target = nexus;
    }

    if (inRangeNexus && dist(this, nexus) < 50) {
      nexus.takeDamage(damage);
    }
  }

  boolean isTargetDead() {
    return ((Attributes)target).isDead;
  }

  void resetTarget() {
    inRangeTurret = false;
    inRangeNexus = false;
    target = player;
  }

  void display() {
    imageMode(CENTER);
    image(ene, x, y);
    healthBar();
  }
}