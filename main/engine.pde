// Main core class of the game ; handles much of the logic 
class Engine {
  // all the projectiles (bonuses, items, shots…)
  ArrayList<Projectile> projectiles;
  // all the targets (player, boss, shield…)
  ArrayList<Target> targets;
  
  Faust player;
  Seth boss;
  
  int score;
  
  // sprite for the player’s life diplay
  PImage playerLifeSprite;

  // constructor
  Engine() {
    this.projectiles = new ArrayList<Projectile>();
    this.targets = new ArrayList<Target>();
    
    this.player = new Faust();
    this.boss = new Seth();
    
    this.targets.add(this.player);
    this.targets.add(this.boss);
    
    this.playerLifeSprite = loadImage(Parameters.PLAYER_LIFE_SPRITE);
    
    Parameters.initialize();
    this.score = 0;
  }

  void update() {
    Parameters.update();
    
    // first we update the entities
    this.checkTargets();
    this.checkProjectiles();
    
    // actions
    this.playerShots();
    this.bossShots();
    this.createBonus();

    // picked up items
    this.handleBulletTime();
    this.handleShield();
    this.handleBomb();
    
    // hud
    this.drawPlayerLifes();
    this.drawBossLifes();
    this.drawScore();
  }
  
  // updates and dra all the projectiles and checks if they are not colliding with a target
  void checkProjectiles() {
    ArrayList<Projectile> deadProjectiles = new ArrayList<Projectile>();
    
    for (Projectile p : this.projectiles) {
      p.update();
      for(Target t : this.targets) {
        if(p.isOut()) {
          p.wasOut();
          p.destroy();
          deadProjectiles.add(p);
        } else if(p.isSuitableTarget(t) && p.isCollidingWith(t)) {
          p.wasHit();
          p.hit(t);
          p.destroy();
          deadProjectiles.add(p);
        } else {
          if(p instanceof Shot && t instanceof Faust && ((Shot)p).isGrazingWith(t)) {
            ((Shot)p).justGrazed();
          }
          p.sketch();
        }
      }
    }

    this.destroyProjectiles(deadProjectiles);
  }

  void destroyProjectiles(ArrayList<Projectile> deadProjectiles) {
    for(Projectile p : deadProjectiles) 
    {
      this.projectiles.remove(p);
      if(p.getDeathType() == DeathType.HIT && p.getScoreType() == DeathType.HIT) {
        this.score += p.getGivenScore();
      } else if (p.getDeathType() == DeathType.OUT && p.getScoreType() == DeathType.OUT) {
        if(p instanceof Shot && ((Shot)p).hasGrazed()) {
          this.score += p.getGivenScore() * 2;
        } else {
          this.score += p.getGivenScore();
        }
      } else if (p instanceof Shot && (p.getTargetHit() instanceof Shield || p.getTargetHit() instanceof Bomb)) {
        score += Parameters.SCORE_WHEN_DESTROYING_SHOT;
      }
    }
  }
  
  // updates and draw all the targets
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
    
    // removal of the now defuncts targets
    for(Target t : deadTargets) 
    {
      this.targets.remove(t);
    }
  }
  
  // controls the player’s shooting
  void playerShots() {
    if(this.player.canShoot()) {
      this.projectiles.add(this.player.shoot());
    }
  }
  
  // controls the boss’ shooting
  void bossShots() {
    if(this.boss.canShoot()) {
      this.projectiles.add(this.boss.shoot());
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
  
  void drawScore() {
    textSize(18);
    textAlign(LEFT);
    fill(#cfe1e3);
    text(this.score, 10, Parameters.BOSS_LIFE_HEIGHT * 2.5);  
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
    
    // if the player already has a shield, we replace it with a new one
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
  
  void handleBomb() {
    if(Parameters.JUST_GOT_BOMB) {
        this.targets.add(new Bomb(this.player));
        Parameters.explodedBomb();
    }
  }
}
