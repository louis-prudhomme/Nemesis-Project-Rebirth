class Game {
  final static int WIDTH = 480;
  final static int HEIGHT = 680;
  final static float FRAMERATE = 60;
  final static color BACKGROUND = #000000;
  final static String PLAYER_LIFE_SPRITE = "../data/gearvie.png";

  ArrayList<Projectile> projectiles;
  Faust player;
  Seth boss;
  
  int lastShot;
  PImage playerLifeSprite;

  Game() {
    this.projectiles = new ArrayList<Projectile>();
    this.player = new Faust();
    this.boss = new Seth();
    
    this.lastShot = 0;
    this.playerLifeSprite = loadImage(PLAYER_LIFE_SPRITE);
  }

  void update() {
    this.player.update();
    this.player.sketch();
    this.boss.update();
    this.boss.sketch();
    
    this.checkProjectiles();
    this.playerShots();
    this.bossShots();
    
    this.drawPlayerLifes();
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
        image(playerLifeSprite, 20 * i, HEIGHT - 20); 
      }
  }
}
