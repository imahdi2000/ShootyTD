PImage nx;
PImage bull;
PImage ene;
PImage turr;
PImage gol;
PImage play;
PImage m1;
Player player;
Nexus nexus;
ArrayList<Bullet> bullets;
ArrayList<Enemy> spawnedEnemies;
ArrayList<Gold> goldList;
/*
 Shop shop;
 ArrayList<Enemy> queuedEnemies;
 ArrayList<Turret> turrets;
 ArrayList<Trap> traps;
 */
int waveInterval;
boolean gameOver;
int highscore;

void setup() {
  // Canvas size
  size(1200, 720);
  nx = loadImage("nexus.png");
  bull = loadImage("bullet.png");
  ene = loadImage("enemy.png");
  turr = loadImage("turret.png");
  gol = loadImage("gold.png");
  play = loadImage("player.png");
  m1 = loadImage("map1.png");
  player = new Player();
  nexus = new Nexus();
  bullets = new ArrayList<Bullet>();
  spawnedEnemies = new ArrayList<Enemy>();
  goldList = new ArrayList<Gold>(); 

  ////spawned one enemy below for testing, remove later
  Enemy dummyEnemy = new Enemy(player);
  spawnedEnemies.add(dummyEnemy);
}

void draw() {
  // Background color white
  //background(255);
  background(0);
  image(m1, 600, 360);
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

  // Display and move enemies
  for (int e = 0; e < spawnedEnemies.size(); e++) {
    spawnedEnemies.get(e).display();
    spawnedEnemies.get(e).move();
    spawnedEnemies.get(e).dead();
    // Remove enemies from ArrayList if they are dead
    if (spawnedEnemies.get(e).isDead) {
      goldList.add(new Gold(spawnedEnemies.get(e), spawnedEnemies.get(e).goldAmount));//add a gold when he dies
      spawnedEnemies.remove(e);
    }
  }

  // Display and move bullets
  for (int b = 0; b < bullets.size(); b++) {
    bullets.get(b).display();
    bullets.get(b).move();
    // Check enemy collision
    for (int e = 0; e < spawnedEnemies.size(); e++) {
      if (bullets.get(b).collidesWithEnemy(spawnedEnemies.get(e))) {
        // Remove bullets after dealing damage to enemy
        spawnedEnemies.get(e).takeDamage(10);
        bullets.remove(bullets.get(b));
        //System.out.println(spawnedEnemies.get(e).isDead);
      }
    }
  }

  // Display gold
  for (int g = 0; g < goldList.size(); g++) {
    goldList.get(g).display();
    // Check for gold collision
    if (player.collidesWithGold(goldList.get(g))) { //if you touch the gold
      //System.out.println(player.money);
      player.money = player.money + goldList.get(g).amount; //add it to ur money
      goldList.remove(g); //remove it from the list
      //System.out.println(player.money);
    }
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