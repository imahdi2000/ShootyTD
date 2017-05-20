Player player;
Nexus nexus;

/*
 Shop shop;
 ArrayList<Enemy> queuedEnemies;
 ArrayList<Enemy> spawnedEnemies;
 ArrayList<Turret> turrets;
 ArrayList<Trap> traps;
 ArrayList<Gold> gold;
 */
int waveInterval;
boolean gameOver;
int highscore;
boolean[] keys = new boolean[128];

void setup() {
  // Canvas size
  size(1200, 720);
  player = new Player();
  nexus = new Nexus();
}

void draw() {
  // Background color white
  background(255);
  noStroke();
  // Display
  player.display();
  nexus.display();
  // Movement
  player.move(keys);
}

void mouseClicked() {
}

void keyPressed() {
  keys[key] = true;
  System.out.println(key);
}

void keyReleased() {
  keys[key] = false; 
}

void saveHighscore() {
}

void gameOver() {
}

void restartGame() {
}