class Weapon {

  int damage;
  int price;
  int fireRate;
  double range;
  String name;
  
  Weapon(String nName, int nDamage, int nPrice, int nFireRate, double nRange) {
    name = nName;
    damage = nDamage;
    price = nPrice;
    fireRate = nFireRate;
    range = nRange;
  }

  int getPrice() {
    return price;
  }

  int getFireRate() {
    return fireRate;  
  }
  
  String getName() {
    return name;  
  }

}