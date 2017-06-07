class Player extends Attributes {

  float speed;
  int money;
  ArrayList<Weapon> weapons;
  int currentWeapon;

  Player() {
    super(600, 300, 300, 300);
    speed = 3;
    money = 0;
    weapons = new ArrayList<Weapon>();
    currentWeapon = 0;
  }

  void setDirX(float x) {
    dir.x = x;
  }

  void setDirY(float y) {
    dir.y = y;
  }

  // WASD movement
  void move() {
    // Move towards
    if (this.x < 15 && dir.x < 0) { //constrain movement
    } else if (this.y < 15 && dir.y < 0) { //constrain movement
    } else if (this.x > width - 15 && dir.x > 0) { //constrain movement
    } else if (this.y > height / 1.3 - 15 && dir.y > 0) { //constrain movement
    } else { //movement
      this.add(dir);
    }
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

  // Health Bar
  void healthBar() {
    if (currentHP >= 0) {
      // Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - 25, y - 25, 50, 6);

      // Bar
      float drawWidth = (float(currentHP) / startingHP) * 50;
      fill(0, 255, 0); // Green
      rect(x - 25, y - 25, drawWidth, 6);
    }
  }


  void display() {
    imageMode(CENTER);
    image(play, x, y);
    healthBar();
  }
}