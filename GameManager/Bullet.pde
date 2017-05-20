class Bullet extends PVector {
  // PVectors have x, y, z components
  PVector velocity;
  color c;
  float x;
  float y;
  
  Bullet(float xSpawn, float ySpawn, PVector velocity) {
    super(xSpawn, ySpawn);
    this.velocity = velocity;
    c = color(100,100,100);
    x = xSpawn;
    y = ySpawn;
  }
  
  void move() {
    add(velocity);
  }
  
  void display() {
    fill(c);
    ellipse(x, y, 10, 10);
  }
  
  boolean collidesWithEnemy(Object enemy) {
    return false;
  }
}