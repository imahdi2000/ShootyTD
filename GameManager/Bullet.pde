class Bullet extends PVector {
  // PVectors have x, y components
  PVector velocity;
  color c;
  
  // Player/Turret location, direction to shoot
  Bullet(PVector spawnPos, PVector dir) {
    super(spawnPos.x, spawnPos.y);
    velocity = dir;
    c = color(100,100,100);
  }
  
  void move() {
    this.add(velocity);
  }
  
  void display() {
    fill(c);
    ellipse(x, y, 10, 10);
  }
  
  boolean collidesWithEnemy(Object enemy) {
    return false;
  }
}