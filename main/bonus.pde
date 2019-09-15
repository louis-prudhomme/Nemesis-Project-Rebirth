class Bonus extends Projectile {
  static final int BONUS_SWIFTNESS = 2;
  static final String SHOT_SPRITE = "../data/projectmeat.png";

  Bonus(float x, float y, Target t) {
    super(x, y, loadImage(SHOT_SPRITE), t, BONUS_SWIFTNESS);
  }
  
  void update() {
    this.ypos += this.swiftness * Parameters.GAME_SPEED;
  }
  
  void hit() {
    ((Faust)this.target).eatFood();
  }
}
