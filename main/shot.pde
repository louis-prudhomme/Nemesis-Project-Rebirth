class Shot extends Projectile {
  static final int SHOT_SWIFTNESS = 5;
  static final String SHOT_SPRITE = "../data/projectellipse.png";

  Shot(float x, float y) {
    super(x, y, loadImage(SHOT_SPRITE), IFoe.class, SHOT_SWIFTNESS);
  }

  void update() {
    this.ypos -= this.swiftness;
  }

  void hit(Target t) {
    t.gotHit();
  }
}
