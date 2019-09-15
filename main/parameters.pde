static class Parameters {
  final static int WIDTH = 480;
  final static int HEIGHT = 680;
  final static float FRAMERATE = 60;
  final static float BONUS_SPAWN_INTERVAL = 5 * FRAMERATE;
  final static color BACKGROUND = #000000;
  final static String PLAYER_LIFE_SPRITE = "../data/gearvie.png";
  final static int PLAYER_LIFE_INITIAL_SPACING = 20;
  final static int PLAYER_LIFE_ADDITIONAL_SPACING = 30;
  final static int BOSS_LIFE_HEIGHT = 20;
  final static float STANDARD_SPEED = 1;
  final static float BULLET_TIME_SPEED = 0.5;
  final static float BULLET_TIME_DURATION = FRAMERATE * 20;
  
  static float GAME_SPEED;
  static float TIMER;
  static float BULLET_TIME_TIMER;
  
  static void initialize() {
    GAME_SPEED = STANDARD_SPEED;
    TIMER = 0;
    BULLET_TIME_TIMER = 0;
  }
  
  static void update() {
    TIMER++;
    BULLET_TIME_TIMER--;
  }
  
  static void startBulletTime() {
     BULLET_TIME_TIMER = BULLET_TIME_DURATION;
     GAME_SPEED = BULLET_TIME_SPEED;
  }
  
  static void endBulletTime() {
     GAME_SPEED = STANDARD_SPEED;
  }
}
