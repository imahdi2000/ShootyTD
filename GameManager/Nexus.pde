class Nexus extends Attributes { 
  
  Nexus() {
    super(width / 2, height / 2 + 25, 2000, 2000);
  }

  // Health Bar
  void healthBar() {
    if (currentHP >= 0) {
      // Outline
      stroke(0);
      fill(255, 0, 0);
      rect(x - 40, y - 40, 80, 7);

      // Bar
      float drawWidth = (float(currentHP) / startingHP) * 80;
      fill(0, 255, 0); // Green
      rect(x - 40, y - 40, drawWidth, 7);
    }
  }
  
  boolean isDead(){
   return currentHP < 0; 
  }

  void display() {
    // ellipse(x, y, 50, 50);
    healthBar();
    imageMode(CENTER);
    image(nx, x, y);
  }
}