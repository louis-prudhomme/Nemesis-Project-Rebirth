class Item extends Projectile {
  static final int ITEM_SWIFTNESS = 5;
  static final String ITEM_SPRITE = "../data/projectitem.png";
  
  Item(float x, float y, Faust t) {
    super(x, y, loadImage(ITEM_SPRITE), t, ITEM_SWIFTNESS); 
  }
  
  void update() {
    this.ypos += this.swiftness;
  }
  
  void hit() {
    ((Faust)this.target).gotLife();
  }
  
}
