// contains all of the game’s parameters
static class Parameters {
  // window
  final static int WIDTH = 480;
  final static int HEIGHT = 680;
  final static float FRAMERATE = 60;
  final static color BACKGROUND = #000000;
  // misc
  final static int SCORE_WHEN_DESTROYING_SHOT = 50;
  final static float BONUS_SPAWN_INTERVAL = 1 * FRAMERATE;
  final static String PLAYER_LIFE_SPRITE = "../data/gearvie.png";
  // hud
  final static int PLAYER_LIFE_INITIAL_SPACING = 20;
  final static int PLAYER_LIFE_ADDITIONAL_SPACING = 30;
  final static int BOSS_LIFE_HEIGHT = 20;
  // speed of the game
  final static float STANDARD_SPEED = 1;
  final static float BULLET_TIME_SPEED = 0.5;
  final static float BULLET_TIME_DURATION = FRAMERATE * 5;
  
  // current game speed (equal to standard most of the time)
  static float GAME_SPEED;
  // clock of the game ; runs without interruption
  static float TIMER;
  // clock for the bullet-time effect ; decounts
  static float BULLET_TIME_TIMER;
  // marks the obtention of a shield
  static boolean JUST_GOT_SHIELD;
  // marks the obtention of a bomb
  static boolean JUST_GOT_BOMB;
  
  static void initialize() {
    GAME_SPEED = STANDARD_SPEED;
    TIMER = 0;
    BULLET_TIME_TIMER = 0;
    JUST_GOT_SHIELD = false;
    JUST_GOT_BOMB = false;
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
  
  static void startShield() {
    JUST_GOT_SHIELD = true;
  }
  
  static void gaveShield() {
    JUST_GOT_SHIELD = false;
  }
  
  static void startBomb() {
    JUST_GOT_BOMB = true;
  }
  
  static void explodedBomb() {
    JUST_GOT_BOMB = false;  
  }
}
