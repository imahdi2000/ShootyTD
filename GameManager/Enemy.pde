class Enemy extends PVector {

  PVector dir;
  PVector target;
  float speed;
  int startingHP;
  int currentHP;
  int damage;
  int goldAmount;
  Boolean isDead;
  color c;

  Enemy(PVector newTarget) {
    super(800, 300);
    dir = new PVector();
    target = newTarget;
    speed = 2;
    startingHP = 100;
    currentHP = 100;
    goldAmount = 50;
    isDead = false;
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

  void attack() {
    // If it touches target (player --> smack smack)
    // (nexus --> Remove from array and deal damage to nexus)
  }

  void dropGold() {
  }

  void takeDamage(int damage) {
    currentHP -= damage;
  }

  void dead() {
    if (currentHP <= 0) {
      dropGold();
      isDead = true;
    }
  }

  // Turn red if less than 25% hp
  void healthBar() {
    if (currentHP <= 25) {
      fill(255, 0, 0); // Red
    } else {
      fill(0, 255, 0); // Green
    }

    if (currentHP >= 0) {
      
      // Bar
      float drawWidth = (float(currentHP) / startingHP) * 50;
      rect(x - 25, y - 25, drawWidth, 5);

      // Outline
      stroke(0);
      noFill();
      rect(x - 25, y - 25, 50, 5);
      
    }
  }

  void display() {
    fill(c);
    ellipse(x, y, 30, 30);
    healthBar();
  }
}