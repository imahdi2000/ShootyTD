class Player {

  int startingHP;
  int currentHP;
  int money;
  //ArrayList<Weapon> weapons
  boolean isDead;
  color c;


  // Movement
  float speed;   
  float x;
  float y;
  float dx;
  float dy;

  Player() {
    startingHP = 100;
    currentHP = 100;
    money = 0;
    //weapons = new ArrayList<Weapon>();
    isDead = false;
    c = color(102, 255, 102);

    speed = 3;  //initial speed is 3
    x = 600;  
    y = 300;
    dx = 0;
    dy = 0;
  }

  // WASD movement
  void move(boolean[] keys) {
    if (keys['w']) { // Up
      y -= 1;
    }
    if (keys['a']) { // Left
      x -= 1;
    }
    if (keys['s']) { // Down
      y += 1;
    }
    if (keys['d']) { // Right
      x += 1;
    }
  }

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