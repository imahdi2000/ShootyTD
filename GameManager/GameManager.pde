Player player;
Nexus nexus;
ArrayList<Bullet> bullets;
ArrayList<Enemy> spawnedEnemies;
/*
 Shop shop;
 ArrayList<Enemy> queuedEnemies;
 ArrayList<Turret> turrets;
 ArrayList<Trap> traps;
 ArrayList<Gold> gold;
 */
int waveInterval;
boolean gameOver;
int highscore;

void setup() {
  // Canvas size
  size(1200, 720);
  player = new Player();
  nexus = new Nexus();
  bullets = new ArrayList<Bullet>();
  spawnedEnemies = new ArrayList<Enemy>();


  ////spawned one enemy below for testing, remove later
  Enemy dummyEnemy = new Enemy(player);
  spawnedEnemies.add(dummyEnemy);
}

void draw() {
  // Background color white
  background(255);
  noStroke();
  smooth();
  // Display
  player.display();
  nexus.display();

  // Movement
  player.move();

  // Mouse vector
  PVector mouse = new PVector(mouseX, mouseY);
  fill(0);
  ellipse(mouse.x, mouse.y, 5, 5);

  // Framecount is the firerate (change to weapon's firerate later)
  if (mousePressed && frameCount % 15 == 0) {
    PVector dir = PVector.sub(mouse, player); // Direction
    dir.normalize(); // Unit vector
    dir.mult(8); // Bullet speed

    // Add bullet to arraylist
    Bullet b = new Bullet(player, dir);
    bullets.add(b);
  }

  // Display and move bullets
  for (Bullet b : bullets) {
    b.display();
    b.move();
  }

  // Display and move enemies
  for (Enemy e : spawnedEnemies) {
    e.display();
    e.move();
  }
}

// Player movement - move
void keyPressed() {
      if (key == 'w' || keyCode == UP) { // Up
        player.setDirY(-3);
      }
      if (key == 'a' || keyCode == LEFT) { // Left
        player.setDirX(-3);
      }
      if (key == 's' || keyCode == DOWN) { // Down
        player.setDirY(3);
      }
      if (key == 'd' || keyCode == RIGHT) { // Right
        player.setDirX(3);
    }  
}

// Player movement - stop moving
void keyReleased() {
  if (key == 'w' || key == 's' || keyCode == UP || keyCode == DOWN) { 
    player.setDirY(0);
  } else if (key == 'a' || key == 'd' || keyCode == LEFT || keyCode == RIGHT) {
    player.setDirX(0);
  }
}

void saveHighscore() {
}

void gameOver() {
}

void restartGame() {
}