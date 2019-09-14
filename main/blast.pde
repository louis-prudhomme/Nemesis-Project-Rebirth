class Blast extends Projectile {
  static final int SHOT_SWIFTNESS = 5;
  static final String SHOT_SPRITE = "../data/projecttriangle.png";
  static final int SHOT_RADIUS = 5;
  static final color SHOT_HITBOX_COLOR = #ee1313;  
  
  int swiftness;
  
  Blast(float x, float y, Target t) {
    super(x, y, SHOT_RADIUS, loadImage(SHOT_SPRITE), SHOT_HITBOX_COLOR, t);
    swiftness = SHOT_SWIFTNESS;
  }
  
  void update() {
    this.ypos += this.swiftness;
  }
  
  void hit() {
    this.target.gotHit();
  }
}
