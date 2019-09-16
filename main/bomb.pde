// represents the bombs
class Bomb extends Target implements IPlayer {
  static final int BOMB_INITIAL_RADIUS = 10;
  static final int BOMB_MAXIMUM_RADIUS = 600;
  static final int BOMB_LIFES = Integer.MAX_VALUE;
  static final int BOMB_RADIUS_INCREMENT = 30;
  static final color BOMB_COLOR = #E4717A;
  static final int BOMB_STROKE_WEIGHT = 3;
  
  // constructor
  Bomb(Faust f) {
    super(f.getX(), f.getY(), BOMB_INITIAL_RADIUS, null, BOMB_COLOR, BOMB_LIFES, 0, 0);
  }

  // when current raidus is greater than max radius we destroy the bomb
  void update() {
     this.radius += BOMB_RADIUS_INCREMENT;
     if(this.radius >= BOMB_MAXIMUM_RADIUS) {
       this.lifes = 0;  
     }
  }
  
  // since there is nothing to be drawn, we override the bomb
  @Override
  void sketch() {
    strokeWeight(BOMB_STROKE_WEIGHT);
    noFill();
    stroke(this.hitboxColor);
    
    ellipse(xpos, ypos, radius, radius);
    strokeWeight(1);
    stroke(#000000);
  }
  
  Projectile shoot() {
    return null;
  }
}
