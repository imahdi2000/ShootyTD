//Grid class
class Cell {
  int x;
  int y;
  
  Turret occupant = null;
  Stack<Trap> traps;

  Cell(int newX, int newY) {
    x = newX;
    y = newY;
    traps = new Stack<Trap>();
  }


  void build(Turret t) {//build turret
    if (buildable()) {
      occupant = t;
      turrets.add(t);
      buyingTurret = false;
      player.decreaseMoney(t.getPrice());
    }
  }

  void build(Trap t) {//build trap
    if (trapBuildable() && buyingTrap) {
      traps.push(t);
      buyingTrap = false;
      player.decreaseMoney(t.getPrice());
    }
  }

  boolean buildable() {//turret placable
    if (occupant == null && traps.size() == 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean trapBuildable() {//trap placable
    if (occupant == null) {
      return true;
    } else {
      return false;
    }
  }

  void outline() {
    noFill();
    if (buildable()) {
      stroke(#00FF00);
    } else {
      stroke(#FF0000);
    }
    rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }
}