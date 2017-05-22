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

  void display() {
    fill(c);
    ellipse(x, y, 20, 20);
  }
}