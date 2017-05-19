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
Boolean gameOver;
int highscore;

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
  player.display();
  nexus.display();
}

void mouseClicked() {
}

void saveHighscore() {
}

void gameOver() {
}

void restartGame() {
}