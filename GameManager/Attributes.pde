abstract class Attributes extends PVector {

  protected PVector dir;
  protected int startingHP;
  protected int currentHP;
  protected float HPDrawWidth;
  protected boolean isDead;
  
  Attributes() {
    x = width / 3;
    y = height / 3;
    dir = new PVector();
    startingHP = 100;
    currentHP = 100;
    HPDrawWidth = 50;
    isDead = false;
  }

  Attributes(int nx, int ny, int startHP, int currHP) {
    x = nx;
    y = ny;
    dir = new PVector();
    startingHP = startHP;
    currentHP = currHP;
    isDead = false;
    HPDrawWidth = (float(currentHP) / startingHP) * (float(startingHP) / 2);
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
      float moveBy = (HPDrawWidth / 2);
      // Red damaged background + Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - moveBy, y - 25, HPDrawWidth, 5);

      // Bar
      float drawWidth = float(currentHP) / startingHP * (float(startingHP) / 2);
      fill(0, 255, 0); // Green
      rect(x - moveBy, y - 25, drawWidth, 5);
    }
  }
  
  abstract void display();
}