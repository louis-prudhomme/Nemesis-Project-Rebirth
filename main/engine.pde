class Engine {
  ArrayList<Projectile> projectiles;
  Faust player;
  Seth boss;
  
  int lastShot;
  PImage playerLifeSprite;

  Engine() {
    this.projectiles = new ArrayList<Projectile>();
    this.player = new Faust();
    this.boss = new Seth();
    
    this.lastShot = 0;
    this.playerLifeSprite = loadImage(Parameters.PLAYER_LIFE_SPRITE);
    
    Parameters.initialize();
  }

  void update() {
    Parameters.update();
    
    this.player.update();
    this.player.sketch();
    this.boss.update();
    this.boss.sketch();
    
    this.checkProjectiles();
    this.playerShots();
    this.bossShots();
    this.createBonus();
    this.handleBulletTime();
    
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
      image(playerLifeSprite, Parameters.PLAYER_LIFE_ADDITIONAL_SPACING * i + Parameters.PLAYER_LIFE_INITIAL_SPACING, Parameters.HEIGHT - Parameters.PLAYER_LIFE_INITIAL_SPACING); 
    }
  }
  
  void drawBossLifes() {
    float barLenght = Parameters.WIDTH / Seth.SETH_LIVES;
    fill(#ff0000);
    for (int i = 0; i < boss.getLifes(); i++) {
      rect(Parameters.WIDTH - barLenght * (i + 1), 0, barLenght, Parameters.BOSS_LIFE_HEIGHT);
    }
  }
  
  void createBonus() {
    if(Parameters.TIMER % Parameters.BONUS_SPAWN_INTERVAL == 0) {
      this.projectiles.add(new Bonus(random(Parameters.WIDTH), random(-500, 0), this.player));
      this.projectiles.add(new Item(random(Parameters.WIDTH), random(-500, 0), this.player));
    }
  }
  
  void handleBulletTime() {
    if(Parameters.GAME_SPEED == Parameters.BULLET_TIME_SPEED && Parameters.BULLET_TIME_TIMER <= 0) {
      Parameters.endBulletTime();
    }
  }
}
