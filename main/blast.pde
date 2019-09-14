class Blast extends Projectile {
  static final int BLAST_SWIFTNESS = 5;
  static final String BLAST_SPRITE = "../data/projecttriangle.png";
    
  Blast(float x, float y, Target t, int sw) {
    super(x, y, loadImage(BLAST_SPRITE), t, BLAST_SWIFTNESS);
  }
  
  void update() {
    this.ypos += this.swiftness;
  }
  
  void hit() {
    this.target.gotHit();
  }
}
