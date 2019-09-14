public class Faust extends Target {
  static final float FAUST_STARTING_X = Game.WIDTH / 2;
  static final float FAUST_STARTING_Y = Game.HEIGHT - Game.HEIGHT / 30;
  static final int FAUST_RADIUS_NORMAL = 10;
  static final int FAUST_SWIFTNESS = 5;
  static final String FAUST_SPRITE_NORMAL = "../data/spritefaustar1.png";
  static final color FAUST_HITBOX_COLOR = #ffffff;
  static final int FAUST_LIFES = 3;
  final static float FAUST_SHOT_INTERVAL = Game.FRAMERATE * 1.5;
  int food;
  
  Faust() {
    super(FAUST_STARTING_X, FAUST_STARTING_Y, FAUST_RADIUS_NORMAL, loadImage(FAUST_SPRITE_NORMAL), 
      FAUST_HITBOX_COLOR, FAUST_LIFES, FAUST_SHOT_INTERVAL, FAUST_SWIFTNESS);
    this.food = 0;
  }
  
  void update() {
    this.lastShot++;
    
    float distX = mouseX - this.xpos;
    float distY = mouseY - this.ypos;
    
    this.xpos += abs(distX) > this.swiftness ? Helper.getSign(distX) * this.swiftness : distX;
    this.ypos += abs(distY) > this.swiftness ? Helper.getSign(distY) * this.swiftness : distY;
  }
  
  void eatFood() {this.food++;}
  int getFoodEaten(){return this.food;}
}
