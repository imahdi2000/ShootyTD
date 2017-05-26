PImage nx;
PImage bull;
PImage ene;
PImage turr;
PImage gol;
PImage play;
//PImage m1;
Player player;
Nexus nexus;
ArrayList<Bullet> bullets;
ArrayList<Enemy> spawnedEnemies;
ArrayList<Gold> goldList;
ArrayList<Turret> turrets;
Shop shop;
/*
 ArrayList<Enemy> queuedEnemies;
 ArrayList<Trap> traps;
 */
int waveInterval;
boolean gameOver;
int highscore;

void setup() {
  // Canvas size
  size(1200, 720);
  nx = loadImage("nexus.png");
  bull = loadImage("bullets.png");
  ene = loadImage("enemy.png");
  turr = loadImage("turret.png");
  gol = loadImage("gold.png");
  play = loadImage("player.png");
  // m1 = loadImage("map1.png");
  player = new Player();
  nexus = new Nexus();
  bullets = new ArrayList<Bullet>();
  spawnedEnemies = new ArrayList<Enemy>();
  goldList = new ArrayList<Gold>(); 
  turrets = new ArrayList<Turret>();
  shop = new Shop();

  ////spawned one enemy below for testing, remove later
  Enemy dummyEnemy = new Enemy(player);
  Enemy dummy2 = new Enemy(player);
  spawnedEnemies.add(dummyEnemy);
  spawnedEnemies.add(dummy2);

  //spawn a turret for testing
  Turret dummyTurret = new Turret(dummyEnemy);
  turrets.add(dummyTurret);
}

void draw() {
  // Background color white
  background(255);
  //background(0);
  //image(m1, 600, 360);
  noStroke();
  smooth();
  // Display
  player.display();
  nexus.display();
  shop.display();

  // Movement
  player.move();

  // Mouse vector
  PVector mouse = new PVector(mouseX, mouseY);
  fill(0);
  ellipse(mouse.x, mouse.y, 5, 5);

  // Framecount is the firerate (change to weapon's firerate later)
  if (mousePressed && frameCount % player.getCurrentWeapon().getFireRate() == 0) {
    PVector dir = PVector.sub(mouse, player); // Direction
    dir.normalize(); // Unit vector
    dir.mult(8); // Bullet speed

    // Add bullet to arraylist
    Bullet b = new Bullet(player, dir);
    bullets.add(b);
  }

  // Display and move enemies
  for (int e = 0; e < spawnedEnemies.size(); e++) {
    Enemy en = spawnedEnemies.get(e);
    en.display();
    en.move();
    en.dead();
    en.attackPlayer(player);
    en.attackNexus(nexus);
    // Remove enemies from ArrayList if they are dead
    if (en.isDead) {
      goldList.add(new Gold(en, en.goldAmount));//add a gold when he dies
      spawnedEnemies.remove(e);
    }
  }

  // Display and move bullets
  for (int b = 0; b < bullets.size(); b++) {
    Bullet bu = bullets.get(b);
    bu.display();
    bu.move();
    // Check enemy collision
    for (int e = 0; e < spawnedEnemies.size(); e++) {
      if (bu.collidesWithEnemy(spawnedEnemies.get(e))) {
        // Remove bullets after dealing damage to enemy
        spawnedEnemies.get(e).takeDamage(10);
        bullets.remove(bu);
        //System.out.println(spawnedEnemies.get(e).isDead);
      }
    }
  }

  // Display gold
  for (int g = 0; g < goldList.size(); g++) {
    goldList.get(g).display();
    // Check for gold collision
    if (player.collidesWithObject(goldList.get(g))) { //if you touch the gold
      //System.out.println(player.money);
      player.money = player.money + goldList.get(g).amount; //add it to ur money
      goldList.remove(g); //remove it from the list
      //System.out.println(player.money);
    }
  }

  // Display turrets
  for (int t = 0; t < turrets.size(); t++) {
    turrets.get(t).display();
    if (!turrets.get(t).isTargetDead()) {
      if (frameCount % turrets.get(t).getFireRate() == 0 && turrets.get(t).enemyInRange()) {
        PVector dir = PVector.sub(turrets.get(t).target, turrets.get(t)); // Direction
        dir.normalize(); // Unit vector
        dir.mult(8); // Bullet speed

        // Add bullet to arraylist
        Bullet b = new Bullet(turrets.get(t), dir);
        bullets.add(b);
      }
    } else {
      
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

  // Shop
  void mouseClicked() {
    //System.out.println("Triggered");
    shop.buy();
  }

  void saveHighscore() {
  }

  void gameOver() {
  }

  void restartGame() {
  }