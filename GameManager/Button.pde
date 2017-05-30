class Button {
  String name;
  String price;
  String damage;
  float x = 525;
  float y = 600;
  float w = 150;
  float h = 80;


  Button() {
    name = "";
    price = "0";
    damage = "0";
  }

  Button(String n, String p, String d) {
    name = n; 
    price = p; 
    damage = d;
  }

  void display() { 
    rect(x, y, w, h);
    fill(255);
  }
}