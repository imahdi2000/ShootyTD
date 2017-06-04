class Trap extends PVector {

  int damage;
  int price;

  Trap(int newDamage, int newPrice, int newX, int newY) {
    damage = newDamage;
    price = newPrice;
    x = newX;
    y = newY;
  }

  void dealDamage() {
  }

  boolean collidesWithEnemy(Object Enemy) {
    return false;
  }

  int getPrice() {
    return price;
  }

  void display() {
    fill(#FFFF00);
    rect(x - 15, y - 15, 30, 30);
  }

  boolean collidesWithEnemy(Enemy enemy) {
    float d = dist(this, enemy);
    //System.out.println(d);
    return  d <= 20;
  }
}