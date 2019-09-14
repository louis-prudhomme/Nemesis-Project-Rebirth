abstract class Target extends Entity {
  int lifes;
  int lastShot;
  float shotInterval;
  
  Target(float x, float y, int r, PImage s, color c, int l, float i) {
    super(x, y, r, s, c);
    
    this.lifes = l;
    this.lastShot = 0;
    this.shotInterval = i;
  }
  
  int getLifes() {return this.lifes;}
  void gotHit() {this.lifes--;}
  
  int getLastShot() {return this.lastShot;}
  boolean canShoot() {return this.lastShot >= this.shotInterval;}
  void shots() {
    this.lastShot = 0; 
  }
  
  abstract void update();
}
