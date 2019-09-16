// represents the player
public class Faust extends Target implements IPlayer {
  static final float FAUST_STARTING_X = Parameters.WIDTH / 2;
  static final float FAUST_STARTING_Y = Parameters.HEIGHT - Parameters.HEIGHT / 30;
  static final int FAUST_RADIUS_NORMAL = 10;
  static final int FAUST_RADIUS_OBESE = 20;
  static final int FAUST_SWIFTNESS = 5;
  static final String FAUST_SPRITE_NORMAL = "../data/spritefaustar1.png";
  static final String FAUST_SPRITE_OBESE = "../data/spritefaustob.png";
  static final color FAUST_HITBOX_COLOR = #ffffff;
  static final int FAUST_LIFES = 3;
  static final float FAUST_SHOT_INTERVAL = Parameters.FRAMERATE * 1.5;
  static final int OBESITY_CAP = 10;
  static final float OBESITY_TIMER = Parameters.FRAMERATE * 30;
  static final String FAUST_SHOTS_SPRITE = "../data/projectellipse.png";
  static final int FAUST_SHOTS_SWIFTNESS = 5;
  static final int FAUST_SHOTS_TYPE = ShotTypes.STRAIGHT;
  
  // number of food bonuses eaten
  int food;
  // clock for obesity state
  float obesityTimer;
  
  Faust() {
    super(FAUST_STARTING_X, FAUST_STARTING_Y, FAUST_RADIUS_NORMAL, loadImage(FAUST_SPRITE_NORMAL), 
      FAUST_HITBOX_COLOR, FAUST_LIFES, FAUST_SHOT_INTERVAL, FAUST_SWIFTNESS);
    this.food = 0;
    this.obesityTimer = 0;
  }
  
  void update() {
    this.lastShot++;
    
    // if faust is obese and the countdown is over
    if(this.radius == FAUST_RADIUS_OBESE && this.obesityTimer <= 0) {
      this.skinnify();  
    } else {
      this.obesityTimer--;
    }
    
    float distX = mouseX - this.xpos;
    float distY = mouseY - this.ypos;
    
    this.xpos += abs(distX) > this.swiftness ? Helper.getSign(distX) * this.swiftness : distX;
    this.ypos += abs(distY) > this.swiftness ? Helper.getSign(distY) * this.swiftness : distY;
  }
  
  Projectile shoot() {
    this.lastShot = 0;
    return new Shot(this.xpos, this.ypos, IFoe.class, loadImage(FAUST_SHOTS_SPRITE), FAUST_SHOTS_SWIFTNESS, FAUST_SHOTS_TYPE);
  }
  
  void eatFood() {
    this.food++;
    if (this.food % OBESITY_CAP == 0) {
      this.obesify();
    }
  }
  
  void obesify() {
    this.sprite = loadImage(FAUST_SPRITE_OBESE);
    this.radius = FAUST_RADIUS_OBESE;
    this.obesityTimer = OBESITY_TIMER;
  }
  
  void skinnify() {
    this.sprite = loadImage(FAUST_SPRITE_NORMAL);
    this.radius = FAUST_RADIUS_NORMAL;
  }
  
  int getFoodEaten(){return this.food;}
  
  void gotLife() {this.lifes++;}
}
