class Button {
  String name;
  int price;
  int damage;
  float x = 750;
  float y = 600;
  float w = 150;
  float h = 80;
  color c;
  Object obj;

  Button() {
    name = "";
    price = 0;
    damage = 0;
  }

  Button(String n, int p, int d) {
    name = n; 
    price = p; 
    damage = d;
    c = color(0, 255, 0);
  }

  boolean pressed() {
    // If mouse is hovering over CORRESPONDING button
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      return true;
    } else {
      return false;
    }
  }

  void display() { 
    fill(c);
    rect(x, y, w, h);
  }
}