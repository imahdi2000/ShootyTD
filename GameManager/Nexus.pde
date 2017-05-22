class Nexus extends PVector{ 

  int startingHP;
  int currentHP;
  boolean isDead;
  color c;

  Nexus() {
    startingHP = 1000;
    currentHP = 1000;
    isDead = false;
    c = color(102, 204, 255);
    x = width / 2;
    y = height / 2;
  }

  void takeDamage(int damage) {
    currentHP -= damage;
  }

  void dead() {

  }

  void display() {
    fill(c);
    ellipse(x, y, 50, 50);
  }
}