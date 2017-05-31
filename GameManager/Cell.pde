//Grid class
class Cell {
  int x;
  int y;

  Turret occupant = null;

  void build(Turret t) {
    if (buildable() && buying) {
      occupant = t;
      turrets.add(t);
      buying = false;
      player.decreaseMoney(t.getPrice());
    }
  }

  boolean buildable() {
    if (occupant == null) {
      return true;
    } else {
      return false;
    }
  }

  void outline() {
    noFill();
    stroke(#00FF00);
    rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }

  Cell(int newX, int newY) {
    x = newX;
    y = newY;
  }
}