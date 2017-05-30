class Button {
  String name;
  String price;
  String damage;
  float x = 750;
  float y = 600;
  float w = 150;
  float h = 80;
  color c;

  Button() {
    name = "";
    price = "0";
    damage = "0";
  }

  Button(String n, String p, String d) {
    name = n; 
    price = p; 
    damage = d;
    c = color(0,255,0);
  }

  void display() { 
    fill(c);
    rect(x, y, w, h);
  }
}