abstract class Projectile extends Entity {
  static final int PROJECTILE_RADIUS = 5;
  static final color PROJECTILE_HITBOX_COLOR = #dddddd;

  Class target;
  
  Projectile(float x, float y, PImage s, Class t, float sw) {
       super(x, y, PROJECTILE_RADIUS, s, PROJECTILE_HITBOX_COLOR, sw);
       this.target = t;
  }
  
  Class getTarget() {
    return this.target; 
  }
  
  boolean isSuitableTarget(Target t) {
    return this.target.isInstance(t);
  }
  
  void destroy() {
    this.xpos = -666;
    this.ypos = -666;
    this.radius = 0;
  }
  
  abstract void hit(Target t);
}
