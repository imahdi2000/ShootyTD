PImage nx;
PImage bull;
PImage ene;
PImage turr;
PImage gol;
PImage play;
LList map;
PImage m1; //green
PImage m2;//red
PImage m3;//purple
PImage gameover;
//int MVar;
Player player;
Nexus nexus;
Shop shop;

ArrayList<Bullet> bullets;
ArrayList<Enemy> spawnedEnemies;
ArrayList<Queue<Enemy>> queuedEnemies;
ArrayList<Gold> goldList;
ArrayList<Turret> turrets;
String[] highscorefile;


boolean record;
int wave;
int score;
boolean gameOver;
boolean buyingTurret;
boolean buyingTrap;

static float cellSize = 30; //how big the cells are
Cell[][] Grid = new Cell[40][24];
Cell hoverCell;

void setup() {
  // Canvas size
  size(1200, 720);
  nx = loadImage("nexus.png");
  bull = loadImage("bullets.png");
  ene = loadImage("enemy.png");
  turr = loadImage("turret.png");
  gol = loadImage("gold.png");
  play = loadImage("player.png");
  gameover = loadImage("gameover.png");
  map = new LList();
  m1 = loadImage("map1.png");
  m2 = loadImage("map2.png");
  m3 = loadImage("map3.png");
  map.add(m3);
  map.add(m2);
  map.add(m1);

  highscorefile = loadStrings("highscore.csv");

  //for (String s : highscorefile) {
  //print(s + ", ");
  //}

  player = new Player();
  nexus = new Nexus();
  bullets = new ArrayList<Bullet>();
  spawnedEnemies = new ArrayList<Enemy>();
  queuedEnemies = new ArrayList<Queue<Enemy>>();
  goldList = new ArrayList<Gold>(); 
  turrets = new ArrayList<Turret>();
  shop = new Shop();
  buyingTurret = false;
  buyingTrap = false;
  wave = 0;
  record = true;
  // Enemy Queue
  for (int w = 0; w < 10; w++) {
    Queue<Enemy> enemyQ = new Queue<Enemy>();
    for (int e = 0; e < random(10, 26); e++) {
      Enemy enemy = new Enemy(player, (int)random(1, 4), (int)random(50, 121));
      enemyQ.enqueue(enemy);
    }
    queuedEnemies.add(enemyQ);
    //map.get(wave);
  }

  //create grid
  for (int x = 0; x <Grid.length; x++) {
    for (int y = 0; y < Grid[0].length; y ++) {
      Grid[x][y] = new Cell(x, y);
    }
  }
}

void draw() {
  // Background color white
  //background(gameover);
  //background(map.size());

  //mkaes sure i don't get nullpointer inspection due to the amount of elemnets in map
  if (gameOver == false) {
    if ((wave < map.size())) { 
      background(map.get(wave));
    } else {
      background(gameover);
    }

    //image(m1, 600, 360);
    noStroke();
    smooth();
    // Display
    player.display();
    nexus.display();
    shop.display();
    //if(queuedEnemies.size() < 1){
    //System.out.println("Queue is empty"); 
    //}
    // Movement
    player.move();

    //Show money
    textSize(32);
    textAlign(CENTER);
    text("$" + player.money, width / 1.1, height / 1.1); 
    text("Wave " + (wave + 1), width / 2, height / 20);
    text("Score: " + score, 1050, 40);
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

    // Enemy dequeue
    spawnEnemies();
    // Display and move enemies
    for (int e = 0; e < spawnedEnemies.size(); e++) {
      Enemy en = spawnedEnemies.get(e);
      en.display();
      en.move();
      en.dead();
      en.attackPlayer(player);
      en.attackNexus(nexus);

      // Locate turret to attack
      for (int t = 0; t < turrets.size(); t++) {
        en.attackTurret(turrets.get(t));
      }

      // Find new target
      if (en.isTargetDead()) {
        en.resetTarget();
      }

      // Remove enemies from ArrayList when they die
      if (en.isDead) {
        goldList.add(new Gold(en, en.goldAmount));//add a gold when he dies
        spawnedEnemies.remove(en);
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
        score += goldList.get(g).amount;
        goldList.remove(g); //remove it from the list
        //System.out.println(player.money);
      }
    }

    // Display turrets
    for (int t = 0; t < turrets.size(); t++) {
      Turret tur = turrets.get(t);
      tur.display();
      tur.dead();
      tur.findTarget(spawnedEnemies);

      // Shooting
      if (frameCount % tur.getFireRate() == 0 && tur.enemyInRange() && !tur.isTargetDead()) {
        PVector dir = PVector.sub(tur.target, tur); // Direction
        dir.normalize(); // Unit vector
        dir.mult(8); // Bullet speed

        // Add bullet to arraylist
        Bullet b = new Bullet(tur, dir);
        bullets.add(b);
      }

      // Dead
      if (tur.isDead) {
        turrets.remove(tur);
      }
    }

    // Display Traps
    for (int r = 0; r < Grid.length; r++) {
      for (int c = 0; c < Grid[0].length; c++) { 
        if (Grid[r][c].hasOccupant()) {
          // Turret removal
          if (Grid[r][c].occupant.isDead) {
            Grid[r][c].occupant = null;
          }
        }
        Trap tr = Grid[r][c].traps.get();
        if (tr != null) {
          tr.display();
          for (int e = 0; e < spawnedEnemies.size(); e++) {
            if (tr.collidesWithEnemy(spawnedEnemies.get(e))) {
              // Remove trap after dealing damage to enemy
              spawnedEnemies.get(e).takeDamage(tr.damage);
              Grid[r][c].traps.pop();
            }
          }
        }
      }
    }

    //check mouse for hovercell
    if (buyingTurret || buyingTrap) {
      mouseCheck();
    }
    if (player.currentHP < 1) {
      gameOver = true;
      record = false;
    }
    if (nexus.isDead()) {
      gameOver = true;
      record = false;
    }
    if (wave == 3) {
      gameOver = true;
      record = false;
    }
  } else {
    background(gameover); 
    textSize(32);
    textAlign(CENTER);
    text("GAME OVER  :(", 600, 270);
    text("FINAL SCORE", 590, 320);
    text(Integer.toString(score), 590, 370);
    text("PRESS R TO PLAY AGAIN", 590, 500);
    keyPressed();
    //if(mouseClicked() == true



    if (!record) { //recording highscore
      for (int i = 0; i < highscorefile.length; i++) {
        if (score > Integer.parseInt(highscorefile[i])) {
          for (int x = highscorefile.length - 1; x > i; x--) {
              highscorefile[x] = "" + highscorefile[x - 1]; //keep old numbers
          }
          highscorefile[i] = Integer.toString(score); 
          record = true;
          break;
        }
      }
      saveStrings("highscore.csv", highscorefile);
      record = true;
    }
  }
}

void mouseCheck() {
  int x = (int)(mouseX / cellSize);
  int y = (int)(mouseY / cellSize);

  if (x < Grid.length && y < Grid[0].length) {
    hoverCell = Grid[x][y];
    hoverCell.outline(); //error here idk
  }
}


// Player movement
void keyPressed() {
  if (key == 'r' && gameOver == true ) {
    gameOver = false;
    //System.out.println(gameOver);
    restartGame();
  }
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
  shop.pressed();
  if (shop.button.get(3).triggered) {
    buyingTurret = true;
    shop.button.get(3).triggered = false;
    System.out.println("Triggered");
  }
  if (shop.button.get(4).triggered) {
    buyingTrap = true;
    shop.button.get(3).triggered = false;
    System.out.println("Triggered trap");
  }
}

void mousePressed() {
  if (hoverCell != null) {
    if (hoverCell.turretBuildable() && buyingTurret && player.money >= 50) {
      hoverCell.build(new Turret(new PVector(10000, 10000), hoverCell.x * 30 + 15, hoverCell.y * 30 + 15, (int)random(100, 201), (int)random(10, 21)));
    } else if (hoverCell.trapBuildable() && buyingTrap && player.money >= 50) {
      hoverCell.build(new Trap((int)random(75, 151), 50, hoverCell.x * 30 + 15, hoverCell.y * 30 + 15));
    }
  }
}

// Spawn an enemy every X frames --- Randomize spawning
void spawnEnemies() {
  if (frameCount % 200 == 0 && !queuedEnemies.get(wave).isEmpty() && (wave < map.size())) {
    spawnedEnemies.add(queuedEnemies.get(wave).dequeue());
  }

  if (queuedEnemies.get(wave).isEmpty() && spawnedEnemies.isEmpty() && (wave < map.size())) {
    wave++;
    System.out.println("Wave " + (wave + 1));
  }
}

void saveHighscore() {
}

void gameOver() {
}

void restartGame() {
  wave = 0;
  player = new Player();
  nexus = new Nexus();
  score = 0;
  setup();
}