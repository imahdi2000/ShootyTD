class Nexus extends PVector { 

  int startingHP;
  int currentHP;
  boolean isDead;
  color c;

  Nexus() {
    super(width / 2, height / 2);
    startingHP = 1000;
    currentHP = 1000;
    isDead = false;
    c = color(102, 204, 255);
  }

  void takeDamage(int damage) {
    currentHP -= damage;
  }

  void dead() {
  }

  // Health Bar
  void healthBar() {
    if (currentHP >= 0) {
      // Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - 40, y - 40, 80, 7);

      // Bar
      float drawWidth = (float(currentHP) / startingHP) * 80;
      fill(0, 255, 0); // Green
      rect(x - 40, y - 40, drawWidth, 7);
    }
  }

  void display() {
    fill(c);
    // ellipse(x, y, 50, 50);
    healthBar();
    imageMode(CENTER);
    image(nx, x, y);
  }
}