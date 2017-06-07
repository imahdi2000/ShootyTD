//Grid class
class Cell {
  int x;
  int y;

  Turret occupant;
  Stack<Trap> traps;

  Cell(int newX, int newY) {
    x = newX;
    y = newY;
    traps = new Stack<Trap>();
  }

  boolean hasOccupant() {
    return occupant != null;
  }

  void build(Turret t) {//build turret
    if (turretBuildable()) {
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

  boolean turretBuildable() {// turret placable
    return !hasOccupant() && traps.size() == 0;
  }

  boolean trapBuildable() {// trap placable
    return !hasOccupant();
  }

  void outline() {
    noFill();
    if (turretBuildable() && buyingTurret || trapBuildable() && buyingTrap) {
      stroke(#33cc33);
      fill(#00FF00);
    } else {
      stroke(#cc3333);
      fill(#FF0000);
    }
    rect(x * cellSize, y * cellSize, cellSize, cellSize);
  }
}