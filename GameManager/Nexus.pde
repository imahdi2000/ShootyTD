class Nexus { 
  int startingHP;
  int currentHP;

  Nexus(int newHP) {
    currentHP = newHP;
  }

  void takeDamage(int damage) {
    currentHP -= damage;
  }
  /*
  void dead() {
  }
  */
  void display() {
     ellipse(600, 360, 10, 10);
  }
}