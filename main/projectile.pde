// base class for all of the projectiles (bonuses, items, shots…)
abstract class Projectile extends Entity {
  static final int PROJECTILE_RADIUS = 5;
  static final color PROJECTILE_HITBOX_COLOR = #dddddd;

  // will contain one of the two interfaces, IFoe or IPlayer, to mark which target it is supposed to hit
  Class target;
  
  int givenScore;
  int scoreType;
  
  // constructor
  Projectile(float x, float y, PImage s, Class t, float sw, int st, int gs) {
       super(x, y, PROJECTILE_RADIUS, s, PROJECTILE_HITBOX_COLOR, sw);
       this.target = t;
       this.scoreType = st;
       this.givenScore = gs;
  }
  
  Class getTarget() {
    return this.target; 
  }
  
  int getScoreType(){return this.scoreType;}
  int getGivenScore(){return this.givenScore;}
  
  // checks if a target matches the objective
  boolean isSuitableTarget(Target t) {
    return this.target.isInstance(t);
  }
  
  //checks if the projectile is out of screen
  boolean isDead() {
    if(this.swiftness < 0 && this.ypos < 0) {
      return true;
    } else if(this.swiftness > 0 && this.ypos > Parameters.HEIGHT) {
      return true;
    }
    return false;
  }
  
  void destroy() {
    this.xpos = -666;
    this.ypos = -666;
    this.radius = 0;
  }
  
  // forces the derived classes to implement a method to call a hit on something
  abstract void hit(Target t);
}
