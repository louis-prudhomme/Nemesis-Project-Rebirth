abstract class Projectile extends Entity {
  static final int PROJECTILE_RADIUS = 5;
  static final color PROJECTILE_HITBOX_COLOR = #dddddd;

  Target target;
  
  Projectile(float x, float y, PImage s, Target t, float sw) {
       super(x, y, PROJECTILE_RADIUS, s, PROJECTILE_HITBOX_COLOR, sw);
       this.target = t;
  }
  
  Target getTarget() {
    return this.target; 
  }
  
  boolean isCollidingWithTarget() {
    return this.isCollidingWith(this.target); 
  }
  
  void destroy() {
    this.xpos = -666;
    this.ypos = -666;
    this.radius = 0;
  }
  
  abstract void hit();
}
