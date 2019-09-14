class Seth extends Target {
  static final float SETH_STARTING_X = Game.WIDTH / 2;
  static final float SETH_STARTING_Y = 0;
  static final float SETH_ENDING_Y = Game.HEIGHT / 10;
  static final int SETH_RADIUS = 10;
  static final float SETH_SWIFTNESS = 0.25;
  static final String SETH_SPRITE = "../data/spritesethailes.png";
  static final color SETH_HITBOX_COLOR = #ffffff;
  static final int SETH_LIVES = 5;
  final static float SETH_SHOT_INTERVAL = Game.FRAMERATE * 1;

  int lives;
  
  Seth() {
    super(SETH_STARTING_X, SETH_STARTING_Y, SETH_RADIUS, loadImage(SETH_SPRITE), SETH_HITBOX_COLOR, 
      SETH_LIVES, SETH_SHOT_INTERVAL, SETH_SWIFTNESS);
    this.lives = SETH_LIVES;
  }
  
  void update() {
    this.lastShot++;
    
    if(this.ypos <= Seth.SETH_ENDING_Y) {
      this.ypos = this.ypos + this.swiftness;
    }
  }  
}
