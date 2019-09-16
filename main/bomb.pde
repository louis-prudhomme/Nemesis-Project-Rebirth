// represents the bombs
class Bomb extends Target implements IPlayer {
  static final int BOMB_INITIAL_RADIUS = 10;
  static final int BOMB_MAXIMUM_RADIUS = 600;
  static final int BOMB_LIFES = Integer.MAX_VALUE;
  static final int BOMB_RADIUS_INCREMENT = 30;
  
  // constructor
  Bomb(Faust f) {
    super(f.getX(), f.getY(), BOMB_INITIAL_RADIUS, null, 0, BOMB_LIFES, 0, 0);
  }

  // when current raidus is greater than max radius we destroy the bomb
  void update() {
     this.radius += BOMB_RADIUS_INCREMENT;
     if(this.radius >= BOMB_MAXIMUM_RADIUS) {
       this.lifes = 0;  
     }
  }
  
  // since there is nothing to be drawn, we override the bomb
  @Override
  void sketch() {  }
}
