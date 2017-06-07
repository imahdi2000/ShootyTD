class Enemy extends Attributes {

  PVector target;
  float speed;
  int damage;
  int goldAmount;
  boolean inRangeNexus; // player does not get attacked if target is nexus
  boolean inRangeTurret;

  Enemy(PVector newTarget, int nDamage, int nStartingHP) {
    // Left, Top, Right spawning
    if ((int)random(2) == 0) {
      x = (int)random(1200);
      y = 0;
    } else {
      if ((int)random(2) == 0) {
        x = 0;
      } else {
        x = 1200;
      }
      y = (int)random(300, height / 1.3);
    }
    startingHP = nStartingHP;
    target = newTarget;
    speed = random(1, 2.4);
    damage = nDamage;
    goldAmount = (int)random(30,51);
    inRangeNexus = false;
    inRangeTurret = false;
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

  void attackPlayer(Player player) {
    // If it touches target (player --> smack smack)
    // Attack player
    if (dist(this, player) < 40 && !inRangeNexus) {
      dir.x = 0;
      dir.y = 0;
      player.takeDamage(damage);
    }
  }

  void attackTurret(Turret turret) {
    // If it touches target (turret --> smack smack)
    // Attack turret
    if (dist(this, turret) < 100 && !inRangeNexus && frameCount % 20 == 0) {
      inRangeTurret = true;
      target = turret;
    }

    if (inRangeTurret && dist(this, turret) < 40) {
      dir.x = 0;
      dir.y = 0;
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
      dir.x = 0;
      dir.y = 0;
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