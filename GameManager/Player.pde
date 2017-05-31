class Player extends PVector {

  PVector dir;
  float speed;
  int startingHP;
  int currentHP;
  int money;
  ArrayList<Weapon> weapons;
  int currentWeapon;
  boolean isDead;
  color c;
  ArrayList<Object> inventory;

  Player() {
    super(600, 300);
    weapons = new ArrayList<Weapon>();
    dir = new PVector();
    speed = 3;
    startingHP = 100;
    currentHP = 100;
    money = 0;
    weapons = new ArrayList<Weapon>();
    currentWeapon = 0;
    isDead = false;
    c = color(102, 255, 102);
    inventory = new ArrayList<Object>();
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
    currentHP -= damage;
  }

  void dead() {
  }

  // Health Bar
  void healthBar() {
    if (currentHP >= 0) {
      // Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - 25, y - 25, 50, 5);

      // Bar
      float drawWidth = (float(currentHP) / startingHP) * 50;
      fill(0, 255, 0); // Green
      rect(x - 25, y - 25, drawWidth, 5);
    }
  }

  boolean collidesWithObject(PVector obj) {
    float d = dist(this, obj);
    //System.out.println(d);
    return  d <= 10;
  }

  void display() {
    fill(c);
    // ellipse(x, y, 20, 20);
    imageMode(CENTER);
    image(play, x, y);
    healthBar();
  }


  int getMoney() {
    return money;
  }

  void decreaseMoney(int cost) {
    money -= cost;
  }

  void addWeapon(Weapon pewpew) {
    weapons.add(pewpew);
  }
  
  void setCurrentWeapon(int weapNum) {
    currentWeapon = weapNum;  
  }
  
  Weapon getCurrentWeapon() {
    return weapons.get(currentWeapon); 
  }
}