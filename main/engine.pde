class Engine {
  ArrayList<Projectile> projectiles;
  ArrayList<Target> targets;
  
  Faust player;
  Seth boss;
  
  int lastShot;
  PImage playerLifeSprite;

  Engine() {
    this.projectiles = new ArrayList<Projectile>();
    this.targets = new ArrayList<Target>();
    
    this.player = new Faust();
    this.boss = new Seth();
    
    this.targets.add(this.player);
    this.targets.add(this.boss);
    
    this.lastShot = 0;
    this.playerLifeSprite = loadImage(Parameters.PLAYER_LIFE_SPRITE);
    
    Parameters.initialize();
  }

  void update() {
    Parameters.update();
    
    this.checkTargets();
    this.checkProjectiles();
    
    this.playerShots();
    this.bossShots();
    this.createBonus();
    
    this.handleBulletTime();
    this.handleShield();
    
    this.drawPlayerLifes();
    this.drawBossLifes();
  }
  
  void checkProjectiles() {
    ArrayList<Projectile> deadProjectiles = new ArrayList<Projectile>();
    
    for (Projectile p : this.projectiles) {
      p.update();
      for(Target t : this.targets) {
        if(p.isSuitableTarget(t) && p.isCollidingWith(t)) {
          p.hit(t);
          p.destroy();
          deadProjectiles.add(p);
        } else {
          p.sketch(); 
        }
      }
    }
    
    for(Projectile p : deadProjectiles) 
    {
      this.projectiles.remove(p);
    }
  }
  
  void checkTargets() {
    ArrayList<Target> deadTargets = new ArrayList<Target>();
    
    for(Target t : this.targets) {
      if(t.getLifes() > 0) {
        t.update();
        t.sketch();
      } else {
        deadTargets.add(t);
      }
    }
    
    for(Target t : deadTargets) 
    {
      this.targets.remove(t);
    }
  }
  
  void playerShots() {
    if(this.player.canShoot()) {
      this.projectiles.add(new Shot(this.player.getX(), this.player.getY()));
      this.player.shots();
    }
  }
  
  void bossShots() {
    if(this.boss.canShoot()) {
      this.projectiles.add(new Blast(this.boss.getX(), this.boss.getY()));
      this.boss.shots();
    }
  }
  
  void drawPlayerLifes() {
    for (int i = 0; i < this.player.getLifes(); i++) {
      image(this.playerLifeSprite, Parameters.PLAYER_LIFE_ADDITIONAL_SPACING * i + Parameters.PLAYER_LIFE_INITIAL_SPACING, Parameters.HEIGHT - Parameters.PLAYER_LIFE_INITIAL_SPACING); 
    }
  }
  
  void drawBossLifes() {
    float barLenght = Parameters.WIDTH / Seth.SETH_LIFES;
    fill(#ff0000);
    for (int i = 0; i < this.boss.getLifes(); i++) {
      rect(Parameters.WIDTH - barLenght * (i + 1), 0, barLenght, Parameters.BOSS_LIFE_HEIGHT);
    }
  }
  
  void createBonus() {
    if(Parameters.TIMER % Parameters.BONUS_SPAWN_INTERVAL == 0) {
      this.projectiles.add(new Bonus(random(Parameters.WIDTH), random(-500, 0)));
      this.projectiles.add(new Item(random(Parameters.WIDTH), random(-500, 0)));
    }
  }
  
  void handleBulletTime() {
    if(Parameters.GAME_SPEED == Parameters.BULLET_TIME_SPEED && Parameters.BULLET_TIME_TIMER <= 0) {
      Parameters.endBulletTime();
    }
  }
  
  void handleShield() {
    Shield existingShield = null;
    
    if(Parameters.JUST_GOT_SHIELD) {
       Parameters.gaveShield();
       for(Target t : this.targets) {
         if(t instanceof Shield) {
           existingShield = (Shield)t;
           break;
         }
       }
       if(existingShield != null) {
         this.targets.remove(existingShield); 
       }
       this.targets.add(new Shield(this.player));
    }
  }
}
