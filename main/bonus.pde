class Bonus extends Projectile {
  static final int BONUS_SWIFTNESS = 2;
  static final String SHOT_SPRITE = "../data/projectmeat.png";

  Bonus(float x, float y) {
    super(x, y, loadImage(SHOT_SPRITE), Faust.class, BONUS_SWIFTNESS);
  }
  
  void update() {
    this.ypos += this.swiftness * Parameters.GAME_SPEED;
  }
  
  void hit(Target t) {
    ((Faust)t).eatFood(); 
  }
}
