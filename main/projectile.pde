// base class for all of the projectiles (bonuses, items, shots…)
abstract class Projectile extends Entity {
  static final int PROJECTILE_RADIUS = 5;
  static final color PROJECTILE_HITBOX_COLOR = #dddddd;

  // will contain one of the two interfaces, IFoe or IPlayer, to mark which target it is supposed to hit
  Class target;
  
  // score given by the projectile
  int givenScore;
  //condition to obtain this projectile score
  int scoreType;

  //type of destruction of this projectile
  int deathType;

  //target hit by the projectile
  Target didHit;

  // constructor
  Projectile(float x, float y, PImage s, Class t, float sw, int st, int gs){
    super(x, y, PROJECTILE_RADIUS, s, PROJECTILE_HITBOX_COLOR, sw);
    this.target = t;
    this.scoreType = st;
    this.givenScore = gs;
    this.didHit = null;
  }
  
  Class getTarget() {
    return this.target; 
  }
  
  Target getTargetHit() {return this.didHit;}

  int getScoreType(){return this.scoreType;}
  int getGivenScore(){return this.givenScore;}

  void wasHit() {this.deathType = DeathType.HIT;}
  void wasOut() {this.deathType = DeathType.OUT;}
  int getDeathType() {return this.deathType;}
  
  // checks if a target matches the objective
  boolean isSuitableTarget(Target t) {
    return this.target.isInstance(t);
  }
  
  //checks if the projectile is out of screen
  boolean isOut() {
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
  void hit(Target t) {
    this.didHit = t;
  }
}
