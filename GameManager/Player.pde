class Player extends PVector {

  PVector dir;
  float speed;
  int startingHP;
  int currentHP;
  int money;
  //ArrayList<Weapon> weapons
  boolean isDead;
  color c;

  Player() {
    super(600, 300);
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
    this.add(dir); // Move towards
  }

  // don't need this -- have to incorporate weapon with bullet
  void shoot() {
  }

  void takeDamage(int damage) {
  }

  void dead() {
  }

  // Turn red if less than 25% hp
  void healthBar() {
    if (currentHP < 25) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    float drawWidth = (currentHP / startingHP) * 50;
    rect(x - 25, y - 25, drawWidth, 5);
  }

  void display() {
    fill(c);
    ellipse(x, y, 20, 20);
    healthBar();
  }
}