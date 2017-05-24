class Player extends PVector {

  PVector dir;
  float speed;
  int startingHP;
  int currentHP;
  int money;
  ArrayList<Weapon> weapons;
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

  boolean collidesWithGold(Gold g) {
    float d = dist(this, g);
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

  void setMoney(int cost) {
    money = money - cost;
  }
  
  void setWeapons(Weapon pewpew){
   weapons.add(pewpew); 
  }
}