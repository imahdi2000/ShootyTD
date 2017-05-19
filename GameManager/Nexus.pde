class Nexus { 

  int startingHP;
  int currentHP;
  color c;

  Nexus() {
    startingHP = 1000;
    currentHP = 1000;
    c = color(102, 204, 255);
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