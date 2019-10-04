// represents the items thee player can gather
class Item extends Projectile {
  static final int ITEM_SWIFTNESS = 5;
  static final int ITEM_GIVEN_SCORE = 50;
  static final String ITEM_SPRITE = "../data/projectitem.png";
  
  // random type of the item
  int type;
  
  Item(float x, float y) {
    super(x, y, loadImage(ITEM_SPRITE), Faust.class, ITEM_SWIFTNESS, DeathType.HIT, ITEM_GIVEN_SCORE);
    
    this.type = int(random(0, 4));
  }
  
  void update() {
    this.ypos += this.swiftness * Parameters.GAME_SPEED;
  }
  
  void hit(Target t) {
    // different action depending on the type
    switch(this.type) {
      case ItemTypes.BOMB:
        Parameters.startBomb();
        break;
      case ItemTypes.LIFE:
        ((Faust)t).gotLife();
        break;
      case ItemTypes.BULLET:
        Parameters.startBulletTime();
        break;
      case ItemTypes.SHIELD:
        Parameters.startShield();
        break;
      default:
        text("SQALALA!", Parameters.WIDTH / 2, Parameters.HEIGHT / 2);
    }
  }
}
