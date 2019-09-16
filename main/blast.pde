// attacks from the ennemies (boss…)
class Blast extends Projectile {
  static final int BLAST_SWIFTNESS = 5;
  static final String BLAST_SPRITE = "../data/projecttriangle.png";
    
  Blast(float x, float y) {
    super(x, y, loadImage(BLAST_SPRITE), IPlayer.class, BLAST_SWIFTNESS);
  }
  
  void update() {
    this.ypos += this.swiftness * Parameters.GAME_SPEED;
  }
  
  void hit(Target t) {
    t.gotHit();
  }
}
