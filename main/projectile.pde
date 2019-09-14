abstract class Projectile extends Entity {
  Target target;
  
  Projectile(float x, float y, int r, PImage s, color c, Target t) {
       super(x, y, r, s, c);
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
  
  abstract void hit();;
}
