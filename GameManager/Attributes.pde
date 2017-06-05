abstract class Attributes extends PVector {

  protected PVector dir;
  protected int startingHP;
  protected int currentHP;
  protected boolean isDead;

  Attributes() {
    x = width / 3;
    y = height / 3;
    dir = new PVector();
    startingHP = 100;
    currentHP = 100;
    isDead = false;
  }

  Attributes(int nx, int ny, int startHP, int currHP) {
    x = nx;
    y = ny;
    dir = new PVector();
    startingHP = startHP;
    currentHP = currHP;
    isDead = false;
  }

  void takeDamage(int dmg) {
    currentHP -= dmg;

  }

  void dead() {
    if (currentHP <= 0) {
      isDead = true;
    }
  }
  
  void healthBar() {
    if (currentHP >= 0) {
      float drawWidth = (float(currentHP) / startingHP) * 50;
      
      // Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - 25, y - 25, 50, 5);

      // Bar
      
      fill(0, 255, 0); // Green
      rect(x - 25, y - 25, drawWidth, 5);
    }
  }
  
  abstract void display();
}