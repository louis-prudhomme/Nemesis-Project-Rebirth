class Item extends Projectile {
  static final int ITEM_SWIFTNESS = 5;
  static final String ITEM_SPRITE = "../data/projectitem.png";
  
  int type;
  
  Item(float x, float y, Faust t) {
    super(x, y, loadImage(ITEM_SPRITE), t, ITEM_SWIFTNESS);
    
    //type = int(random(0, 4));
    type = 2;
  }
  
  void update() {
    this.ypos += this.swiftness;
  }
  
  void hit() {
    switch(this.type) {
      case ItemTypes.LIFE:
        ((Faust)this.target).gotLife();
        break;
        
      default:
        text("SQALALA!", Game.WIDTH / 2, Game.HEIGHT / 2);
    }
  }
}
