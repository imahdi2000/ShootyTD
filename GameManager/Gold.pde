class Gold extends PVector {
  int amount;
  color c;

  Gold(PVector deadSpot, int val) {
    this.x = deadSpot.x;
    this.y = deadSpot.y;
    amount = val;
    c = color(255, 232, 0);
  }

  void display() {
    fill(c);
    imageMode(CENTER);
    image(gol,x,y);
  }

  int getAmount() {
    return amount;
  }

  void setAmount(int val) {
    amount = val;
  }
}