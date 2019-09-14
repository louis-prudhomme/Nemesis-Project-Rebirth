class Shot extends Projectile {
  static final int SHOT_SWIFTNESS = 5;
  static final String SHOT_SPRITE = "../data/projectellipse.png";
  
  Shot(float x, float y, Target t) {
    super(x, y, loadImage(SHOT_SPRITE), t, SHOT_SWIFTNESS);
  }
  
  void update() {
    this.ypos -= this.swiftness;
  }
  
  void hit() {
    this.target.gotHit();
  }
}
