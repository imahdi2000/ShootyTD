class Bullet extends PVector {
  // PVectors have x, y components
  PVector loc;
  color c;

  // Player/Turret location, other location (Mouse/enemy)
  Bullet(PVector spawnPos, PVector otherLoc) {
    super(spawnPos.x, spawnPos.y);
    loc = otherLoc;
    c = color(100, 100, 100);
  }

  // Add another vector to current vector to move bullet
  void move() {
    this.add(loc);
  }

  void display() {
    fill(c);
    //ellipse(x, y, 10, 10);
    imageMode(CENTER);
    image(bull, x, y);
  }

  boolean collidesWithEnemy(Enemy enemy) {
    float d = dist(this, enemy);
    //System.out.println(d);
    return  d <= 20;
  }
}