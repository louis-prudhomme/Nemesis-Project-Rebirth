class Item extends Projectile {
  static final int ITEM_SWIFTNESS = 5;
  static final String ITEM_SPRITE = "../data/projectitem.png";
  
  int type;
  
  Item(float x, float y, Faust t) {
    super(x, y, loadImage(ITEM_SPRITE), t, ITEM_SWIFTNESS);
    
    type = int(random(1, 3));
  }
  
  void update() {
    this.ypos += this.swiftness * Parameters.GAME_SPEED;
  }
  
  void hit() {
    switch(this.type) {
      case ItemTypes.LIFE:
        ((Faust)this.target).gotLife();
        break;
      case ItemTypes.BULLET:
        Parameters.startBulletTime();
        break;
      default:
        text("SQALALA!", Parameters.WIDTH / 2, Parameters.HEIGHT / 2);
    }
  }
}
