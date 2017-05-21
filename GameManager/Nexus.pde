class Nexus { 

  int startingHP;
  int currentHP;
  boolean isDead;
  color c;
  float x;
  float y;

  Nexus() {
    startingHP = 1000;
    currentHP = 1000;
    isDead = false;
    c = color(102, 204, 255);
    x = width/2;
    y = width/2 + 100;
  }

  void takeDamage(int damage) {
    currentHP -= damage;
  }

  void dead() {

  }

  void display() {
    fill(c);
    ellipse(600, 360, 50, 50);
  }
}