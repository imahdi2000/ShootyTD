class Player extends PVector {

  PVector loc;
  PVector dir;
  float speed;
  int startingHP;
  int currentHP;
  int money;
  //ArrayList<Weapon> weapons
  boolean isDead;
  color c;

  Player() {
    loc = new PVector(600, 300);
    dir = new PVector();
    speed = 3;
    startingHP = 100;
    currentHP = 100;
    money = 0;
    //weapons = new ArrayList<Weapon>();
    isDead = false;
    c = color(102, 255, 102);
  }

  void setDirX(float x) {
   dir.x = x; 
  }
  
  void setDirY(float y) {
    dir.y = y;
  }
  
  // WASD movement
  void move() {
    player.add(dir); // Move towards
    if (keyPressed) {
      if (key == 'w' || key == UP) { // Up
        dir.y = -speed;
      }
      if (key == 'a' || key == LEFT) { // Left
        dir.x = -speed;
      }
      if (key == 's' || key == DOWN) { // Down
        dir.y = speed;
      }
      if (key == 'd' || key == RIGHT) { // Right
        dir.x = speed;
      }
    } 
  }

  // don't need this -- have to incorporate weapon with bullet
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