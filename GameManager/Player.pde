class Player {

  int startingHP;
  int currentHP;
  int money;
  //ArrayList<Weapon> weapons
  boolean isDead;
  color c;
  // Movement
  float x;
  float y;

  Player() {
    startingHP = 100;
    currentHP = 100;
    money = 0;
    //weapons = new ArrayList<Weapon>();
    isDead = false;
    c = color(102, 255, 102);
    x = 600;  
    y = 300;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  // WASD movement
  void move(boolean[] keys) {
    if (keys['w']) { // Up
      y -= 2;
    }
    if (keys['a']) { // Left
      x -= 2;
    }
    if (keys['s']) { // Down
      y += 2;
    }
    if (keys['d']) { // Right
      x += 2;
    }
  }

  // Create bullet
  void shoot() {
  }

  void takeDamage(int damage) {
  }

  void dead() {
  }

  void display() {
    fill(c);
    ellipse(x, y, 20, 20);
  }
}