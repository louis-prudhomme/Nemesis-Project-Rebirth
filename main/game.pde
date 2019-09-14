class Game {  
  final static int WIDTH = 480;
  final static int HEIGHT = 680;
  final static float FRAMERATE = 60;
  final static float BONUS_SPAWN_INTERVAL = 5 * FRAMERATE;
  final static color BACKGROUND = #000000;
  final static String PLAYER_LIFE_SPRITE = "../data/gearvie.png";
  final static int PLAYER_LIFE_INITIAL_SPACING = 20;
  final static int PLAYER_LIFE_ADDITIONAL_SPACING = 30;
  final static int BOSS_LIFE_HEIGHT = 20;

  ArrayList<Projectile> projectiles;
  Faust player;
  Seth boss;
  
  int lastShot;
  PImage playerLifeSprite;
  int time;

  Game() {
    this.projectiles = new ArrayList<Projectile>();
    this.player = new Faust();
    this.boss = new Seth();
    
    this.lastShot = 0;
    this.playerLifeSprite = loadImage(PLAYER_LIFE_SPRITE);
    this.time = 0;
  }

  void update() {
    time++;
    
    this.player.update();
    this.player.sketch();
    this.boss.update();
    this.boss.sketch();
    
    this.checkProjectiles();
    this.playerShots();
    this.bossShots();
    this.createBonus();
    
    this.drawPlayerLifes();
    this.drawBossLifes();
    
  }
  
  void checkProjectiles() {    
    ArrayList<Projectile> deadProjectiles = new ArrayList<Projectile>();
    
    for (Projectile p : projectiles) {
      p.update();
      if(p.isCollidingWithTarget()) {
        p.hit();
        p.destroy();
        deadProjectiles.add(p);
      } else {
        p.sketch();  
      }
    }
    
    for(Projectile p : deadProjectiles) 
    {
      this.projectiles.remove(p);
    }
  }
  
  void playerShots() {
    if(this.player.canShoot()) {
      this.projectiles.add(new Shot(this.player.getX(), this.player.getY(), this.boss));
      this.player.shots();
    }
  }
  
  void bossShots() {
    if(this.boss.canShoot()) {
      this.projectiles.add(new Blast(this.boss.getX(), this.boss.getY(), this.player));
      this.boss.shots();
    }
  }
  
  void drawPlayerLifes() {
    for (int i = 0; i < player.getLifes(); i++) {
      image(playerLifeSprite, PLAYER_LIFE_ADDITIONAL_SPACING * i + PLAYER_LIFE_INITIAL_SPACING, Game.HEIGHT - PLAYER_LIFE_INITIAL_SPACING); 
    }
  }
  
  void drawBossLifes() {
    float barLenght = Game.WIDTH / Seth.SETH_LIVES;
    fill(#ff0000);
    for (int i = 0; i < boss.getLifes(); i++) {
      rect(Game.WIDTH - barLenght * (i + 1), 0, barLenght, BOSS_LIFE_HEIGHT);
    }
  }
  
  void createBonus() {
    if(this.time % BONUS_SPAWN_INTERVAL == 0) {
      this.projectiles.add(new Bonus(random(WIDTH), random(-500, 0), this.player));
      this.projectiles.add(new Item(random(WIDTH), random(-500, 0), this.player));
    }
  }
}
