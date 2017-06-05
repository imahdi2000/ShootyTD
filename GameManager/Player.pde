class Player extends Attributes {

  float speed;
  int money;
  ArrayList<Weapon> weapons;
  int currentWeapon;
  ArrayList<Object> inventory;

  Player() {
    super(600, 300, 250, 250);
    speed = 3;
    money = 0;
    weapons = new ArrayList<Weapon>();
    currentWeapon = 0;
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

  boolean collidesWithObject(PVector obj) {
    float d = dist(this, obj);
    //System.out.println(d);
    return  d <= 10;
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

  void display() {
    imageMode(CENTER);
    image(play, x, y);
    healthBar();
  }
}