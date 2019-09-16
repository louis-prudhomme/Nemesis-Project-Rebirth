// base class for every actor of the game (player, boss)
abstract class Target extends Entity {
  int lifes;
  int lastShot;
  float shotInterval;
  
  Target(float x, float y, int r, PImage s, color c, int l, float i, float sw) {
    super(x, y, r, s, c, sw);
    
    this.lifes = l;
    this.lastShot = 0;
    this.shotInterval = i;
  }
  int getLifes() {return this.lifes;}
  void gotHit() {this.lifes--;}
  
  int getLastShot() {return this.lastShot;}
  boolean canShoot() {return this.lastShot >= this.shotInterval;}
  abstract Projectile shoot();
  
  // forces all derived classes to implement a way to uupdate their state
  abstract void update();
}
